{-# LANGUAGE RankNTypes #-}
module SkelGrammar where

-- Haskell module generated by the BNF converter

import AbsGrammar
import ErrM
import InterpreterMonad
import qualified Data.Map             as Map
import qualified Data.Sequence as Seq
import Utils
import Data.Foldable (toList, fold)

transIdent :: Ident -> InterpreterMonad Value
transIdent x = case x of
  Ident string -> returnError "not yet implemented 1" -- useless ?
transProgram :: Program -> InterpreterMonad StatementValue
transProgram x = case x of
  SProgram stmts -> do
    status <- transStmts stmts
    case status of
      OK -> return status
      VBreak -> returnError "break used outside loop"
      VContinue -> returnError "continue used outside loop"
      VReturn _ -> returnError "return used outside loop"
transStmts :: Stmts -> InterpreterMonad StatementValue
transStmts x = case x of
  StmtsNull -> return $ OK
  SStmts stmt stmts -> do
    status <- transStmt stmt
    case status of
      OK -> transStmts stmts
      otherwise -> return status

forRecursion :: Ident -> Integer -> Integer -> BracedStmts ->InterpreterMonad StatementValue
forRecursion ident i i2 bracedstmts =
  if (i > i2)
    then
      return OK
    else
      do
        removeVariable ident
        transStmt $ ConstAssign ident (IntLit i)
        status <- transBracedStmts bracedstmts
        let nextLoopStep = forRecursion ident (i + 1) i2 bracedstmts
          in
          case status of
            OK -> nextLoopStep
            VBreak -> return OK
            VContinue -> nextLoopStep
transStmt :: Stmt -> InterpreterMonad StatementValue
transStmt x =
  case x of
    Assign ident exp -> do
      val <- transExp exp
      maybeValue <- getValueWithoutUnwrapping ident
      case maybeValue of
        Nothing -> setVariable ident val
        Just value ->
          case value of
            Const c -> returnError "const variables are not assignable"
            otherwise -> setVariable ident val
    ConstAssign ident exp -> do
      transStmt $ Assign ident exp
      State env store decl <- getState
      let
        Just pos = Map.lookup ident env
        newValue = (Const $ Seq.index store pos)
        newStore = Seq.update pos newValue store
        in setStore newStore
      return OK


    If exp bracedstmts -> do
      val <- transExp exp
      State oldEnv _ oldDecl <- getState
      status <- case val of
        VBoolean b ->
          if b
            then transBracedStmts bracedstmts
            else return OK
        otherwise -> returnError "wrong condition in if"
      setEnv oldEnv
      setDecl oldDecl
      return status
    IfElse exp bracedstmts1 bracedstmts2 -> do
      val <- transExp exp
      State oldEnv _ oldDecl <- getState
      status <- case val of
        VBoolean b ->
          transBracedStmts $
          if b
            then bracedstmts1
            else bracedstmts2
        otherwise -> returnError "wrong condition in if"
      setEnv oldEnv
      setDecl oldDecl
      return status

    For ident exp1 exp2 bracedstmts -> do
      val1 <- transExp exp1
      val2 <- transExp exp2
      case (val1, val2) of
        (VInt i1, VInt i2) ->
          if i1 <= i2
            then do
              maybeOriginalIdent <- getValue ident
              State oldEnv _ oldDecl <- getState
              forRecursion ident i1 i2 bracedstmts
              setEnv oldEnv
              setDecl oldDecl
              case maybeOriginalIdent of
                Just val -> setVariable ident val
                Nothing -> return OK
            else return OK
        otherwise -> returnError "wrong range types in for loop"
      return OK
    While exp bracedstmts -> do
      val <- transExp exp
      State oldEnv _ oldDecl <- getState
      case val of
        VBoolean b ->
          if b
            then do
              status <- transBracedStmts bracedstmts
              let nextLoopStepMonad = transStmt $ While exp bracedstmts
               in case status of
                    OK -> nextLoopStepMonad
                    VBreak -> return OK
                    VContinue -> nextLoopStepMonad
            else return OK
        otherwise -> returnError "wrong condition in while loop"
      setEnv oldEnv
      setDecl oldDecl
      return OK
    Break -> return VBreak
    Continue -> return VContinue
    FuncCall ident exp -> do
      transExp $ FuncCallExp ident exp
      return OK
    FuncDecl ident1 ident2 bracedstmts -> do
      State envDecl storeDecl declDecl <- getState
      let declValue arg =
            let declDecl' = Map.insert ident1 declValue declDecl
              in do
                State envCall storeCall declCall <- getState
                setEnv envDecl
                setDecl declDecl'
                createNewVariable ident2 arg
                status <- transBracedStmts bracedstmts
                State _ newStore _ <- getState
                setEnv envCall
                setDecl declCall
                setStore newStore
                case status of
                  OK -> return Null
                  VReturn v -> return v
                  otherwise -> returnError "Break or continue inside function body"
          newDecl = Map.insert ident1 declValue declDecl
        in
        setDecl newDecl
      return OK
    Return exp -> do
      val <- transExp exp
      return $ VReturn val
    Print parident -> do
      val <- transParExp parident
      printMonad $ case val of
        VInt i -> show i
        VString s -> s
        VBoolean b -> show b
        VList l -> drop 9 $ show l
        VTuple t -> (\s -> "(" ++ s ++ ")") $ reverse $ drop 1 $ reverse $ drop 10 $ show t
    AssignListElem ident exp1 exp2 -> do
      i <- getInt exp1
      val2 <- transExp exp2
      list <- getList ident
      checkBounds list i
      let newList = Seq.update (fromIntegral i) val2 list
        in
        setVariable ident $ VList newList
    AppendListElem ident exp -> do
      val <- transExp exp
      list <- getList ident
      let newList = list Seq.|> val
        in
        setVariable ident $ VList newList
    AssignTuple ident tuple -> do
      val <- transTuple tuple
      setVariable ident val
    SExtract identifiers ident -> do
      listIdents <- transIdentifiers identifiers
      tuple <- getTuple ident
      let leftIds = toList listIdents
          rightValues = toList tuple
        in
        if length leftIds /= length rightValues then
          returnError "wrong length of tuple"
        else
          let
            zipped = zip leftIds rightValues
            pairToMonad (leftId, rightVal) = setVariable leftId rightVal
            monads = map pairToMonad zipped
            in foldl (\m1 m2 -> m1 >> m2) (return OK) monads
transBracedStmts :: BracedStmts -> InterpreterMonad StatementValue
transBracedStmts x = case x of
  SBracedStmts stmts -> transStmts stmts
transParExp :: ParExp -> InterpreterMonad Value
transParExp x = case x of
  SParExp exp -> transExp exp
transLiteral :: Literal -> InterpreterMonad Value
transLiteral x = case x of
  LiteralStr string -> return $ VString string
  LiteralInt integer -> return $ VInt integer
  LiteralBool boolean -> transBoolean boolean
  LiteralTuple tuple -> returnError "not yet implemented 20" -- useless ?
transBoolean :: Boolean -> InterpreterMonad Value
transBoolean x = case x of
  BoolTrue -> return $ VBoolean True
  BoolFalse -> return $ VBoolean False
transExp :: Exp -> InterpreterMonad Value
transExp x = case x of
  ExpList list -> transList list
  ExpTuple tuple -> transTuple tuple
  BoolOr exp1 exp2 -> booleanOp exp1 exp2 "or" (||)
  BoolAnd exp1 exp2 -> booleanOp exp1 exp2 "and" (&&)
  BoolNot exp -> do
    v <- transExp exp
    case v of
      VBoolean b -> return $ VBoolean $ not b
      otherwise -> returnError "Wrong type of not operator"
  BoolIsSmaller exp1 exp2 -> booleanCompOp exp1 exp2 "<" (<) (<)
  BoolSmallerOrEq exp1 exp2 -> booleanCompOp exp1 exp2 "<=" (<=) (<=)
  BoolGreater exp1 exp2 -> booleanCompOp exp1 exp2 ">" (>) (>)
  BoolGreaterOrEq exp1 exp2 -> booleanCompOp exp1 exp2 ">=" (>=) (>=)
  BoolEqual exp1 exp2 -> booleanEqOp exp1 exp2 "==" (==) (==) (==)
  BoolNotEqual exp1 exp2 -> booleanEqOp exp1 exp2 "!=" (/=) (/=) (/=)
  Add exp1 exp2 -> evalInfixOp exp1 exp2
    (\a b -> case (a,b) of
      (VInt i1, VInt i2) -> return $ VInt (i1+i2)
      (VString s1, VString s2) -> return $ VString(s1 ++ s2)
      otherwise -> returnError "Wrong types of + operator")
  IntSub exp1 exp2 -> integerEvalInfixOp exp1 exp2 (-)
  IntMult exp1 exp2 -> integerEvalInfixOp exp1 exp2 (*)
  IntDiv exp1 exp2 -> do
      r <- transExp exp2
      case r of
        VInt 0 -> returnError "Interpreter tried to divide by zero"
        otherwise -> integerEvalInfixOp exp1 exp2 div
  Pare exp -> transExp exp
  IntLit integer -> return $ VInt integer
  BoolLit boolean -> transBoolean boolean
  StringLit string -> return $ VString string
  SSIdent ident -> do
    maybeVal <- getValue ident
    case maybeVal of
      Just val -> return val
      _ -> returnError "Interpreter tried to get value of non-existent variable"
  GetListElem ident exp -> do
    index <- getInt exp
    list <- getList ident
    checkBounds list index
    return $ Seq.index list index
  FuncCallExp ident exp -> do
    val <- transExp exp
    (State _ _ decl) <- getState
    let maybeFunction = Map.lookup ident decl in
      case maybeFunction of
        Just f -> f val
        Nothing -> returnError "Function doesn't exist"
  GetListSize exp -> do
    (VList list) <- transExp exp
    return $ VInt $ toInteger $ length list
transExpressions :: Expressions -> InterpreterMonad (Seq.Seq Value)
transExpressions x = case x of
  SExpNull -> return Seq.empty
  SExp exp expressions -> do
    valRight <- transExpressions expressions
    valSingleLeft <- transExp exp
    return $ (Seq.singleton valSingleLeft) Seq.>< valRight
  SExpSingle exp -> do
    val <- transExp exp
    return $ Seq.singleton val
transIdentifiers :: Identifiers -> InterpreterMonad [Ident]
transIdentifiers x = case x of
  SIdentNull -> return []
  SIdent ident identifiers -> do
    list <- transIdentifiers identifiers
    return $ ident:list
  SIdentSingle ident -> return [ident]
transList :: List -> InterpreterMonad Value
transList x = case x of
  SList expressions -> do
    list <- transExpressions expressions
    return $ VList list
transTuple :: Tuple -> InterpreterMonad Value
transTuple x = case x of
  STuple expressions -> do
    tuple <- transExpressions expressions
    return $ VTuple tuple

evalInfixOp expr1 expr2 op = do
  r1 <- transExp expr1
  r2 <- transExp expr2
  op r1 r2

integerEvalInfixOp :: Exp -> Exp -> (forall a. Integral a => a -> a -> a) -> InterpreterMonad Value
integerEvalInfixOp expr1 expr2 op = do
  r1 <- transExp expr1
  r2 <- transExp expr2
  case (r1,r2) of
    (VInt i, VInt i2) -> return $ VInt (op i i2)
    _ -> returnError "Interpreter expected int values for infix operator"

getValue :: Ident -> InterpreterMonad (Maybe Value)
getValue ident = do
  maybeValue <- getValueWithoutUnwrapping ident
  case maybeValue of
    Nothing -> return Nothing
    Just value -> do
      val <- unwrapConstIfWrapped value
      return $ Just val

getValueWithoutUnwrapping :: Ident -> InterpreterMonad (Maybe Value)
getValueWithoutUnwrapping ident = do
  s <- getState
  let maybePos = Map.lookup ident (env s)
    in
    case maybePos of
      Nothing -> return Nothing
      Just pos ->
        let val = Seq.index (store s) pos
          in return $ Just val

setVariable :: Ident -> Value -> InterpreterMonad StatementValue
setVariable ident val = monad $ \s ->
  case val of
    Null -> Left "Wrong assignment"
    otherwise ->
      let maybePos = Map.lookup ident (env s) in
      case maybePos of
        Just pos ->
          let store' = Seq.update pos val (store s)
          in Right(OK, State (env s) store' (decl s))
        Nothing ->
          let store' = (store s) Seq.|> val in
          let env' = Map.insert ident (length store' - 1) (env s)
          in Right(OK, State env' store' (decl s))

createNewVariable :: Ident -> Value -> InterpreterMonad StatementValue
createNewVariable ident val = monad $ \s ->
  let store' = (store s) Seq.|> val in
  let env' = Map.insert ident (length store' - 1) (env s)
  in Right(OK, State env' store' (decl s))

removeVariable :: Ident -> InterpreterMonad StatementValue
removeVariable ident = monad $ \s -> Right (OK, State (Map.delete ident (env s)) (store s) (decl s) )

--booleanCompOp :: Exp -> Exp -> String -> (forall a. Integral a => a -> a -> Bool) -> InterpreterMonad Value
booleanCompOp expr1 expr2 opMsg opInt opStr = evalInfixOp expr1 expr2
  (\a b -> case (a,b) of
    (VInt i1, VInt i2) -> return $ VBoolean (opInt i1 i2)
    (VString s1, VString s2) -> return $ VBoolean (opStr s1 s2)
    otherwise -> returnError $ "Wrong types of " ++ opMsg ++ " operator")

booleanEqOp expr1 expr2 opMsg opInt opStr opBool = evalInfixOp expr1 expr2
  (\a b -> case (a,b) of
    (VInt i1, VInt i2) -> return $ VBoolean (opInt i1 i2)
    (VString s1, VString s2) -> return $ VBoolean (opStr s1 s2)
    (VBoolean b1, VBoolean b2) -> return $ VBoolean (opBool b1 b2)
    otherwise -> returnError $ "Wrong types of " ++ opMsg ++ " operator")

booleanOp expr1 expr2 opMsg op = evalInfixOp expr1 expr2
  (\a b -> case (a,b) of
    (VBoolean b1, VBoolean b2) -> return $ VBoolean (op b1 b2)
    otherwise -> returnError $ "Wrong types of " ++ opMsg ++ " operator")


getList :: Ident -> InterpreterMonad (Seq.Seq Value)
getList ident = do
  maybeList <- getValue ident
  case maybeList of
    Just value ->
      case value of
        (VList list) -> return $ list
        otherwise -> returnError "Expected list"
    Nothing -> returnError "List doesn't exist"

getTuple :: Ident -> InterpreterMonad (Seq.Seq Value)
getTuple ident = do
  maybeList <- getValue ident
  case maybeList of
    Just value ->
      case value of
        (VTuple list) -> return $ list
        otherwise -> returnError "Expected tuple"
    Nothing -> returnError "Tuple doesn't exist"

getInt :: Exp -> InterpreterMonad (Int)
getInt exp = do
  val <- transExp exp
  case val of
    VInt i -> return $ fromIntegral i
    otherwise -> returnError "Expected int"

checkBounds :: (Seq.Seq Value) -> Int -> InterpreterMonad (Value)
checkBounds list i =
  if  0 <= i && i < length list
  then return Null
  else returnError "Out of bounds exception"