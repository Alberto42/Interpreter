{-# LANGUAGE RankNTypes #-}
module SkelGrammar where

-- Haskell module generated by the BNF converter

import AbsGrammar
import ErrM
import InterpreterMonad
import qualified Data.Map             as Map
import Utils


transIdent :: Ident -> InterpreterMonad Value
transIdent x = case x of
  Ident string -> returnError "not yet implemented 1"
transProgram :: Program -> InterpreterMonad StatementValue
transProgram x = case x of
  SProgram stmts -> transStmts stmts
transStmts :: Stmts -> InterpreterMonad StatementValue
transStmts x = case x of
  StmtsNull -> return $ OK
  SStmts stmt stmts -> do
    status <- transStmt stmt
    case status of
      OK ->transStmts stmts
      otherwise -> return status
transStmt :: Stmt -> InterpreterMonad StatementValue
transStmt x = case x of
  Assign ident exp -> do
    val <- transExp exp
    setVariable ident val

  ConstAssign ident exp -> returnError "not yet implemented 2"
  If exp bracedstmts -> do
    val <- transExp exp
    case val of
      VBoolean b -> if b then transBracedStmts bracedstmts else return OK
      otherwise -> returnError "wrong condition in if"
  IfElse exp bracedstmts1 bracedstmts2 -> do
    val <- transExp exp
    case val of
      VBoolean b -> transBracedStmts $ if b then bracedstmts1 else bracedstmts2
      otherwise -> returnError "wrong condition in if"
  For ident exp1 exp2 bracedstmts -> do
    val1 <- transExp exp1
    val2 <- transExp exp2
    case (val1, val2) of
      (VInt i1, VInt i2) -> if i1 <= i2
        then do
          maybeOriginalIdent <- getVariable ident
          setVariable ident val1
          status <- transBracedStmts bracedstmts
          let nextLoopStepMonad = transStmt $ For ident (IntLit $ i1+1) (IntLit i2) bracedstmts in
            case status of
              OK -> nextLoopStepMonad
              VBreak -> return OK
              VContinue -> nextLoopStepMonad

          case maybeOriginalIdent of
            Just val -> setVariable ident val
            Nothing -> removeVariable ident

        else return OK
      otherwise -> returnError "wrong range types in for loop"
  While exp bracedstmts -> do
    val <- transExp exp
    case val of
      VBoolean b ->
        if b then do
          status <- transBracedStmts bracedstmts
          let nextLoopStepMonad = transStmt $ While exp bracedstmts in
            case status of
              OK -> nextLoopStepMonad
              VBreak -> return OK
              VContinue -> nextLoopStepMonad
        else return OK
      otherwise -> returnError "wrong condition in while loop"
  Break -> return VBreak
  Continue -> return VContinue
  FuncCall ident exp -> returnError "not yet implemented 7"
  FuncDecl ident1 ident2 bracedstmts -> returnError "not yet implemented 8"
  Return exp -> returnError "not yet implemented 9"
  Print parident -> returnError "not yet implemented 10"
  AssignListElem ident exp1 exp2 -> returnError "not yet implemented 11"
  GetListSize list -> returnError "not yet implemented 12"
  AppendListElem ident exp -> returnError "not yet implemented 13"
  AssignTuple ident tuple -> returnError "not yet implemented 14"
  SExtract identifiers ident -> returnError "not yet implemented 15"
transBracedStmts :: BracedStmts -> InterpreterMonad StatementValue
transBracedStmts x = case x of
  SBracedStmts stmts -> transStmts stmts
transParIdent :: ParIdent -> InterpreterMonad Value
transParIdent x = case x of
  SParIdent ident -> returnError "not yet implemented 16"
transLiteral :: Literal -> InterpreterMonad Value
transLiteral x = case x of
  LiteralStr string -> returnError "not yet implemented 17"
  LiteralInt integer -> returnError "not yet implemented 18"
  LiteralBool boolean -> returnError "not yet implemented 19"
  LiteralTuple tuple -> returnError "not yet implemented 20"
transBoolean :: Boolean -> InterpreterMonad Value
transBoolean x = case x of
  BoolTrue -> returnError "not yet implemented 21"
  BoolFalse -> returnError "not yet implemented 22"
transExp :: Exp -> InterpreterMonad Value
transExp x = case x of
  ExpList list -> returnError "not yet implemented 23"
  ExpTuple tuple -> returnError "not yet implemented 24"
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
  BoolLit boolean -> return $ case boolean of
    BoolTrue -> VBoolean True
    BoolFalse -> VBoolean False
  StringLit string -> return $ VString string
  SSIdent ident -> do
    maybeVal <- getVariable ident
    case maybeVal of
      Just val -> return val
      _ -> returnError "Interpreter tried to get value of non-existent variable"
  GetListElem ident exp -> returnError "not yet implemented 25"
transLiterals :: Literals -> InterpreterMonad Value
transLiterals x = case x of
  SLitNull -> returnError "not yet implemented 26"
  SLit literal literals -> returnError "not yet implemented 27"
  SLitSingle literal -> returnError "not yet implemented 28"
transIdentifiers :: Identifiers -> InterpreterMonad Value
transIdentifiers x = case x of
  SIdentNull -> returnError "not yet implemented 29"
  SIdent ident identifiers -> returnError "not yet implemented 30"
  SIdentSingle ident -> returnError "not yet implemented 31"
transList :: List -> InterpreterMonad Value
transList x = case x of
  SList literals -> returnError "not yet implemented 32"
transTuple :: Tuple -> InterpreterMonad Value
transTuple x = case x of
  STuple literals -> returnError "not yet implemented 33"


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

getVariable :: Ident -> InterpreterMonad (Maybe Value)
getVariable var = InterpreterMonad $ \s ->
  let maybeVal = Map.lookup var s in
  Right (maybeVal, s)

setVariable :: Ident -> Value -> InterpreterMonad StatementValue
setVariable ident val = InterpreterMonad $ \s -> Right (OK, Map.insert ident val s)

removeVariable :: Ident -> InterpreterMonad StatementValue
removeVariable ident = InterpreterMonad $ \s -> Right (OK, Map.delete ident s)

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