module InterpreterMonad where

import AbsGrammar (Ident)

data Value = VInt Integer
type State = [(Ident, Value)]

type InterpreterMonadInternal a = Either String (State -> (a,State))
newtype InterpreterMonad a = InterpreterMonad { runInterpreter :: InterpreterMonadInternal a}

func ( InterpreterMonad (Left msg)) s' = InterpreterMonad (Left msg)
func ( InterpreterMonad (Right f) ) s' = InterpreterMonad $ f s'
instance Monad InterpreterMonad where
  return x = InterpreterMonad $ Right $ \s -> (x, s)
  InterpreterMonad (Left msg) >>= f = InterpreterMonad (Left msg)
  InterpreterMonad (Right f) >>= g =
    \s -> let (x,s') = f s in
     case g x of InterpreterMonad (Left msg) ->
                 InterpreterMonad (Right f) ->



