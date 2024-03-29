module InterpreterMonad where

import AbsGrammar (Ident)
import qualified Data.Map             as Map
import qualified Data.Sequence as Seq

data Value = VInt Integer | Null | VString String | VBoolean Bool | VList (Seq.Seq Value) | Const Value | VTuple (Seq.Seq Value)
data StatementValue = OK | VBreak | VContinue | VReturn Value deriving (Show)
type Store = Seq.Seq Value
type Env = Map.Map Ident Int
type DeclValue = Value -> InterpreterMonad Value
type Decl = Map.Map Ident DeclValue
data State = State
  {
    env :: Env,
    store :: Store,
    decl :: Decl
  }

startState = State Map.empty Seq.empty Map.empty
type InterpreterMonadInternal a = State -> Either String (a,State, [Char])
newtype InterpreterMonad a = InterpreterMonad { runInterpreter :: InterpreterMonadInternal a}

instance Functor InterpreterMonad
instance Applicative InterpreterMonad

returnError :: String -> InterpreterMonad a
returnError msg = InterpreterMonad $ \s -> Left msg
instance Monad InterpreterMonad where
  return x = InterpreterMonad $ \s -> Right (x, s, "")
  InterpreterMonad f >>= g = InterpreterMonad $ \s -> case f s of
    Left msg -> Left msg
    Right (x,s', log) -> case runInterpreter (g x) s' of
      Left msg -> Left msg
      Right (x',s'', log') -> Right (x', s'', log ++ log')

instance Show State where
  show x = Map.foldrWithKey (\key val acc ->  acc ++ (show key) ++ " = " ++ (show $ Seq.index (store x) val) ++ "\n") "" (env x)

instance Show Value where
  show val =
    let tmp = reverse . drop 1 . reverse . foldl (\acc next -> acc  ++ (show next) ++ ",") ""
      in
      case val of
        VInt i -> show i
        VString s -> s
        VBoolean b -> show b
        VList l -> "[" ++ (tmp l) ++ "]"
        VTuple t -> "(" ++ (tmp t) ++ ")"
        Const val -> "Final " ++ show val


createMonad :: (State -> State) -> (InterpreterMonad StatementValue)
createMonad f = InterpreterMonad $  \s -> Right (OK,f s, "")

--monad :: InterpreterMonadInternal
monad f = InterpreterMonad $ \x ->
  case f x of
    Right (a,s) -> Right (a,s,"")
    Left msg -> Left msg

getState :: InterpreterMonad State
getState = monad $ \s -> Right (s,s)

setDecl :: Decl -> InterpreterMonad a
setDecl decl = monad $ \(State env store _) -> Right (undefined, State env store decl)

setStore :: Store -> InterpreterMonad a
setStore store = monad $ \(State env _ decl) -> Right (undefined, State env store decl)

setEnv :: Env -> InterpreterMonad a
setEnv env = monad $ \(State _ store decl) -> Right (undefined, State env store decl)

printMonad :: [Char] -> InterpreterMonad StatementValue
printMonad msg = InterpreterMonad $ \s -> Right (OK, s, msg ++ "\n")

unwrapConstIfWrapped :: Value -> InterpreterMonad Value
unwrapConstIfWrapped v = do
  case v of
    Const v2 -> return v2
    otherwise -> return v