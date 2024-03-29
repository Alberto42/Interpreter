{-# LANGUAGE FlexibleInstances, OverlappingInstances #-}
{-# OPTIONS_GHC -fno-warn-incomplete-patterns #-}

-- | Pretty-printer for PrintGrammar.
--   Generated by the BNF converter.

module PrintGrammar where

import AbsGrammar
import Data.Char

-- | The top-level printing method.

printTree :: Print a => a -> String
printTree = render . prt 0

type Doc = [ShowS] -> [ShowS]

doc :: ShowS -> Doc
doc = (:)

render :: Doc -> String
render d = rend 0 (map ($ "") $ d []) "" where
  rend i ss = case ss of
    "["      :ts -> showChar '[' . rend i ts
    "("      :ts -> showChar '(' . rend i ts
    "{"      :ts -> showChar '{' . new (i+1) . rend (i+1) ts
    "}" : ";":ts -> new (i-1) . space "}" . showChar ';' . new (i-1) . rend (i-1) ts
    "}"      :ts -> new (i-1) . showChar '}' . new (i-1) . rend (i-1) ts
    ";"      :ts -> showChar ';' . new i . rend i ts
    t  : ts@(p:_) | closingOrPunctuation p -> showString t . rend i ts
    t        :ts -> space t . rend i ts
    _            -> id
  new i   = showChar '\n' . replicateS (2*i) (showChar ' ') . dropWhile isSpace
  space t = showString t . (\s -> if null s then "" else ' ':s)

  closingOrPunctuation :: String -> Bool
  closingOrPunctuation [c] = c `elem` closerOrPunct
  closingOrPunctuation _   = False

  closerOrPunct :: String
  closerOrPunct = ")],;"

parenth :: Doc -> Doc
parenth ss = doc (showChar '(') . ss . doc (showChar ')')

concatS :: [ShowS] -> ShowS
concatS = foldr (.) id

concatD :: [Doc] -> Doc
concatD = foldr (.) id

replicateS :: Int -> ShowS -> ShowS
replicateS n f = concatS (replicate n f)

-- | The printer class does the job.

class Print a where
  prt :: Int -> a -> Doc
  prtList :: Int -> [a] -> Doc
  prtList i = concatD . map (prt i)

instance Print a => Print [a] where
  prt = prtList

instance Print Char where
  prt _ s = doc (showChar '\'' . mkEsc '\'' s . showChar '\'')
  prtList _ s = doc (showChar '"' . concatS (map (mkEsc '"') s) . showChar '"')

mkEsc :: Char -> Char -> ShowS
mkEsc q s = case s of
  _ | s == q -> showChar '\\' . showChar s
  '\\'-> showString "\\\\"
  '\n' -> showString "\\n"
  '\t' -> showString "\\t"
  _ -> showChar s

prPrec :: Int -> Int -> Doc -> Doc
prPrec i j = if j < i then parenth else id

instance Print Integer where
  prt _ x = doc (shows x)

instance Print Double where
  prt _ x = doc (shows x)

instance Print Ident where
  prt _ (Ident i) = doc (showString i)

instance Print Program where
  prt i e = case e of
    SProgram stmts -> prPrec i 0 (concatD [prt 0 stmts])

instance Print Stmts where
  prt i e = case e of
    StmtsNull -> prPrec i 0 (concatD [])
    SStmts stmt stmts -> prPrec i 0 (concatD [prt 0 stmt, prt 0 stmts])

instance Print Stmt where
  prt i e = case e of
    Assign id exp -> prPrec i 0 (concatD [prt 0 id, doc (showString "="), prt 0 exp])
    ConstAssign id exp -> prPrec i 0 (concatD [doc (showString "final"), prt 0 id, doc (showString "="), prt 0 exp])
    If exp bracedstmts -> prPrec i 0 (concatD [doc (showString "if"), prt 0 exp, prt 0 bracedstmts])
    IfElse exp bracedstmts1 bracedstmts2 -> prPrec i 0 (concatD [doc (showString "if"), prt 0 exp, prt 0 bracedstmts1, doc (showString "else"), prt 0 bracedstmts2])
    For id exp1 exp2 bracedstmts -> prPrec i 0 (concatD [doc (showString "for"), prt 0 id, doc (showString "in"), doc (showString "range"), doc (showString "("), prt 0 exp1, doc (showString ","), prt 0 exp2, doc (showString ")"), prt 0 bracedstmts])
    While exp bracedstmts -> prPrec i 0 (concatD [doc (showString "while"), prt 0 exp, prt 0 bracedstmts])
    Break -> prPrec i 0 (concatD [doc (showString "break")])
    Continue -> prPrec i 0 (concatD [doc (showString "continue")])
    FuncCall id exp -> prPrec i 0 (concatD [prt 0 id, doc (showString "("), prt 0 exp, doc (showString ")")])
    FuncDecl id1 id2 bracedstmts -> prPrec i 0 (concatD [doc (showString "def"), prt 0 id1, doc (showString "("), prt 0 id2, doc (showString ")"), prt 0 bracedstmts])
    Return exp -> prPrec i 0 (concatD [doc (showString "return"), prt 0 exp])
    Print parexp -> prPrec i 0 (concatD [doc (showString "print"), prt 0 parexp])
    AssignListElem id exp1 exp2 -> prPrec i 0 (concatD [prt 0 id, doc (showString "["), prt 0 exp1, doc (showString "]"), doc (showString "="), prt 0 exp2])
    AppendListElem id exp -> prPrec i 0 (concatD [prt 0 id, doc (showString ".append("), prt 0 exp, doc (showString ")")])
    AssignTuple id tuple -> prPrec i 0 (concatD [prt 0 id, doc (showString "="), prt 0 tuple])
    SExtract identifiers id -> prPrec i 0 (concatD [doc (showString "("), prt 0 identifiers, doc (showString ")"), doc (showString "="), prt 0 id])

instance Print BracedStmts where
  prt i e = case e of
    SBracedStmts stmts -> prPrec i 0 (concatD [doc (showString "{"), prt 0 stmts, doc (showString "}")])

instance Print ParExp where
  prt i e = case e of
    SParExp exp -> prPrec i 0 (concatD [doc (showString "("), prt 0 exp, doc (showString ")")])

instance Print Literal where
  prt i e = case e of
    LiteralStr str -> prPrec i 0 (concatD [prt 0 str])
    LiteralInt n -> prPrec i 0 (concatD [prt 0 n])
    LiteralBool boolean -> prPrec i 0 (concatD [prt 0 boolean])
    LiteralTuple tuple -> prPrec i 0 (concatD [prt 0 tuple])

instance Print Boolean where
  prt i e = case e of
    BoolTrue -> prPrec i 0 (concatD [doc (showString "True")])
    BoolFalse -> prPrec i 0 (concatD [doc (showString "False")])

instance Print Exp where
  prt i e = case e of
    ExpList list -> prPrec i 0 (concatD [prt 0 list])
    ExpTuple tuple -> prPrec i 0 (concatD [prt 0 tuple])
    BoolOr exp1 exp2 -> prPrec i 0 (concatD [prt 0 exp1, doc (showString "or"), prt 1 exp2])
    BoolAnd exp1 exp2 -> prPrec i 1 (concatD [prt 1 exp1, doc (showString "and"), prt 2 exp2])
    BoolNot exp -> prPrec i 2 (concatD [doc (showString "not"), prt 2 exp])
    BoolIsSmaller exp1 exp2 -> prPrec i 2 (concatD [prt 3 exp1, doc (showString "<"), prt 3 exp2])
    BoolSmallerOrEq exp1 exp2 -> prPrec i 2 (concatD [prt 3 exp1, doc (showString "<="), prt 3 exp2])
    BoolGreater exp1 exp2 -> prPrec i 2 (concatD [prt 3 exp1, doc (showString ">"), prt 3 exp2])
    BoolGreaterOrEq exp1 exp2 -> prPrec i 2 (concatD [prt 3 exp1, doc (showString ">="), prt 3 exp2])
    BoolEqual exp1 exp2 -> prPrec i 2 (concatD [prt 3 exp1, doc (showString "=="), prt 3 exp2])
    BoolNotEqual exp1 exp2 -> prPrec i 2 (concatD [prt 3 exp1, doc (showString "!="), prt 3 exp2])
    Add exp1 exp2 -> prPrec i 3 (concatD [prt 3 exp1, doc (showString "+"), prt 4 exp2])
    IntSub exp1 exp2 -> prPrec i 3 (concatD [prt 3 exp1, doc (showString "-"), prt 4 exp2])
    IntMult exp1 exp2 -> prPrec i 4 (concatD [prt 4 exp1, doc (showString "*"), prt 5 exp2])
    IntDiv exp1 exp2 -> prPrec i 4 (concatD [prt 4 exp1, doc (showString "/"), prt 5 exp2])
    FuncCallExp id exp -> prPrec i 5 (concatD [prt 0 id, doc (showString "("), prt 0 exp, doc (showString ")")])
    Pare exp -> prPrec i 5 (concatD [doc (showString "("), prt 0 exp, doc (showString ")")])
    IntLit n -> prPrec i 5 (concatD [prt 0 n])
    BoolLit boolean -> prPrec i 5 (concatD [prt 0 boolean])
    StringLit str -> prPrec i 5 (concatD [prt 0 str])
    SSIdent id -> prPrec i 5 (concatD [prt 0 id])
    GetListElem id exp -> prPrec i 5 (concatD [prt 0 id, doc (showString "["), prt 0 exp, doc (showString "]")])
    GetListSize exp -> prPrec i 5 (concatD [doc (showString "len"), doc (showString "("), prt 0 exp, doc (showString ")")])

instance Print Expressions where
  prt i e = case e of
    SExpNull -> prPrec i 0 (concatD [])
    SExp exp expressions -> prPrec i 0 (concatD [prt 0 exp, doc (showString ","), prt 0 expressions])
    SExpSingle exp -> prPrec i 0 (concatD [prt 0 exp])

instance Print Identifiers where
  prt i e = case e of
    SIdentNull -> prPrec i 0 (concatD [])
    SIdent id identifiers -> prPrec i 0 (concatD [prt 0 id, doc (showString ","), prt 0 identifiers])
    SIdentSingle id -> prPrec i 0 (concatD [prt 0 id])

instance Print List where
  prt i e = case e of
    SList expressions -> prPrec i 0 (concatD [doc (showString "["), prt 0 expressions, doc (showString "]")])

instance Print Tuple where
  prt i e = case e of
    STuple expressions -> prPrec i 0 (concatD [doc (showString "("), prt 0 expressions, doc (showString ")")])

