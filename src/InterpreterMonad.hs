module InterpreterMonad where

import AbsGrammar (Ident)
import qualified Data.Map             as Map
import qualified Data.Sequence as Seq

data Value = VInt Integer | Null | VString String | VBoolean Bool deriving (Show)
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
type InterpreterMonadInternal a = State -> Either String (a,State)
newtype InterpreterMonad a = InterpreterMonad { runInterpreter :: InterpreterMonadInternal a}

instance Functor InterpreterMonad
instance Applicative InterpreterMonad

returnError :: String -> InterpreterMonad a
returnError msg = InterpreterMonad $ \s -> Left msg
instance Monad InterpreterMonad where
  return x = InterpreterMonad $ \s -> Right (x, s)
  InterpreterMonad f >>= g = InterpreterMonad $ \s -> case f s of
    Left msg -> Left msg
    Right (x,s') -> case runInterpreter (g x) s' of
      Left msg -> Left msg
      Right (x',s'') -> Right (x', s'')

instance Show State where
  show x = Map.foldWithKey (\key val acc ->  acc ++ (show key) ++ " = " ++ (show $ Seq.index (store x) val) ++ "\n") "\n" (env x)

createMonad :: (State -> State) -> (InterpreterMonad StatementValue)
createMonad f = InterpreterMonad $  \s -> Right (OK,f s)

--monad :: InterpreterMonadInternal
monad f = InterpreterMonad f

getState :: InterpreterMonad State
getState = monad $ \s -> Right (s,s)
