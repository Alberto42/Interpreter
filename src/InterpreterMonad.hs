module InterpreterMonad where

import AbsGrammar (Ident)
import qualified Data.Map             as Map

data Value = VInt Integer | Null | VString String | VBoolean Bool deriving (Show)
type State = Map.Map Ident Value

type InterpreterMonadInternal a = State -> Either String (a,State)
newtype InterpreterMonad a = InterpreterMonad { runInterpreter :: InterpreterMonadInternal a}

instance Functor InterpreterMonad
instance Applicative InterpreterMonad

returnError :: String -> InterpreterMonad Value
returnError msg = InterpreterMonad $ \s -> Left msg
instance Monad InterpreterMonad where
  return x = InterpreterMonad $ \s -> Right (x, s)
  InterpreterMonad f >>= g = InterpreterMonad $ \s -> case f s of
    Left msg -> Left msg
    Right (x,s') -> case runInterpreter (g x) s' of
      Left msg -> Left msg
      Right (x',s'') -> Right (x', s'')



