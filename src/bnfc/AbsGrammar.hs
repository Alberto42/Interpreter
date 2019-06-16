

module AbsGrammar where

-- Haskell module generated by the BNF converter




newtype Ident = Ident String deriving (Eq, Ord, Show, Read)
data Program = SProgram Stmts
  deriving (Eq, Ord, Show, Read)

data Stmts = StmtsNull | SStmts Stmt Stmts
  deriving (Eq, Ord, Show, Read)

data Stmt
    = Assign Ident Exp
    | ConstAssign Ident Exp
    | If Exp BracedStmts
    | IfElse Exp BracedStmts BracedStmts
    | For Ident Exp Exp BracedStmts
    | While Exp BracedStmts
    | Break
    | Continue
    | FuncCall Ident Exp
    | FuncDecl Ident Ident BracedStmts
    | Return Exp
    | Print ParIdent
    | AssignListElem Ident Exp Exp
    | GetListSize List
    | AppendListElem Ident Exp
    | AssignTuple Ident Tuple
    | SExtract Identifiers Ident
  deriving (Eq, Ord, Show, Read)

data BracedStmts = SBracedStmts Stmts
  deriving (Eq, Ord, Show, Read)

data ParIdent = SParIdent Ident
  deriving (Eq, Ord, Show, Read)

data Literal
    = LiteralStr String
    | LiteralInt Integer
    | LiteralBool Boolean
    | LiteralTuple Tuple
  deriving (Eq, Ord, Show, Read)

data Boolean = BoolTrue | BoolFalse
  deriving (Eq, Ord, Show, Read)

data Exp
    = ExpList List
    | ExpTuple Tuple
    | BoolOr Exp Exp
    | BoolAnd Exp Exp
    | BoolNot Exp
    | BoolIsSmaller Exp Exp
    | BoolSmallerOrEq Exp Exp
    | BoolGreater Exp Exp
    | BoolGreaterOrEq Exp Exp
    | BoolEqual Exp Exp
    | BoolNotEqual Exp Exp
    | Add Exp Exp
    | IntSub Exp Exp
    | IntMult Exp Exp
    | IntDiv Exp Exp
    | Pare Exp
    | IntLit Integer
    | BoolLit Boolean
    | StringLit String
    | IntIdent Ident
    | GetListElem Ident Exp
  deriving (Eq, Ord, Show, Read)

data Literals
    = SLitNull | SLit Literal Literals | SLitSingle Literal
  deriving (Eq, Ord, Show, Read)

data Identifiers
    = SIdentNull | SIdent Ident Identifiers | SIdentSingle Ident
  deriving (Eq, Ord, Show, Read)

data List = SList Literals
  deriving (Eq, Ord, Show, Read)

data Tuple = STuple Literals
  deriving (Eq, Ord, Show, Read)

