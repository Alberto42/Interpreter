module Main where

import Lib
import TestGrammar
import System.Environment (getArgs)
import System.IO (openFile, hGetContents)
import System.IO( IOMode( ReadMode ) )
import ErrM( Err( Bad, Ok ) )
import ParGrammar (myLexer, pProgram)
import PrintGrammar (printTree)

parseAndExecute :: String -> IO ()
parseAndExecute s =
  let result = pProgram (myLexer s)
  in case result of
    Bad s -> putStrLn "Parsing failed! :("
    Ok tree -> putStrLn $ printTree tree

main :: IO ()
main = do
  args <- getArgs
  case args of
      [fileName] -> do
        handle <- openFile fileName ReadMode
        contents <- hGetContents handle
        parseAndExecute contents
      _ -> putStrLn "Usage: ./interpreter program_to_run"