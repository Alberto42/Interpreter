module InterpreterMonad where

import AbsGrammar (Ident)

data Value = VInt Integer deriving (Show)
type State = [(Ident, Value)]

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



