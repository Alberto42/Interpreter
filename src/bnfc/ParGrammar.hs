{-# OPTIONS_GHC -w #-}
{-# OPTIONS -XMagicHash -XBangPatterns -XTypeSynonymInstances -XFlexibleInstances -cpp #-}
#if __GLASGOW_HASKELL__ >= 710
{-# OPTIONS_GHC -XPartialTypeSignatures #-}
#endif
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module ParGrammar where
import AbsGrammar
import LexGrammar
import ErrM
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.8

newtype HappyAbsSyn  = HappyAbsSyn HappyAny
#if __GLASGOW_HASKELL__ >= 607
type HappyAny = Happy_GHC_Exts.Any
#else
type HappyAny = forall a . a
#endif
happyIn4 :: (Ident) -> (HappyAbsSyn )
happyIn4 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn4 #-}
happyOut4 :: (HappyAbsSyn ) -> (Ident)
happyOut4 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut4 #-}
happyIn5 :: (String) -> (HappyAbsSyn )
happyIn5 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn5 #-}
happyOut5 :: (HappyAbsSyn ) -> (String)
happyOut5 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut5 #-}
happyIn6 :: (Integer) -> (HappyAbsSyn )
happyIn6 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn6 #-}
happyOut6 :: (HappyAbsSyn ) -> (Integer)
happyOut6 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut6 #-}
happyIn7 :: (Program) -> (HappyAbsSyn )
happyIn7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn7 #-}
happyOut7 :: (HappyAbsSyn ) -> (Program)
happyOut7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut7 #-}
happyIn8 :: (Stmts) -> (HappyAbsSyn )
happyIn8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn8 #-}
happyOut8 :: (HappyAbsSyn ) -> (Stmts)
happyOut8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut8 #-}
happyIn9 :: (Stmt) -> (HappyAbsSyn )
happyIn9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn9 #-}
happyOut9 :: (HappyAbsSyn ) -> (Stmt)
happyOut9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut9 #-}
happyIn10 :: (BracedStmts) -> (HappyAbsSyn )
happyIn10 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn10 #-}
happyOut10 :: (HappyAbsSyn ) -> (BracedStmts)
happyOut10 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut10 #-}
happyIn11 :: (ParIdent) -> (HappyAbsSyn )
happyIn11 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn11 #-}
happyOut11 :: (HappyAbsSyn ) -> (ParIdent)
happyOut11 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut11 #-}
happyIn12 :: (Literal) -> (HappyAbsSyn )
happyIn12 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn12 #-}
happyOut12 :: (HappyAbsSyn ) -> (Literal)
happyOut12 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut12 #-}
happyIn13 :: (Boolean) -> (HappyAbsSyn )
happyIn13 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn13 #-}
happyOut13 :: (HappyAbsSyn ) -> (Boolean)
happyOut13 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut13 #-}
happyIn14 :: (Exp) -> (HappyAbsSyn )
happyIn14 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn14 #-}
happyOut14 :: (HappyAbsSyn ) -> (Exp)
happyOut14 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut14 #-}
happyIn15 :: (IntExp) -> (HappyAbsSyn )
happyIn15 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn15 #-}
happyOut15 :: (HappyAbsSyn ) -> (IntExp)
happyOut15 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut15 #-}
happyIn16 :: (IntExp) -> (HappyAbsSyn )
happyIn16 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn16 #-}
happyOut16 :: (HappyAbsSyn ) -> (IntExp)
happyOut16 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut16 #-}
happyIn17 :: (IntExp) -> (HappyAbsSyn )
happyIn17 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn17 #-}
happyOut17 :: (HappyAbsSyn ) -> (IntExp)
happyOut17 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut17 #-}
happyIn18 :: (BoolExp) -> (HappyAbsSyn )
happyIn18 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn18 #-}
happyOut18 :: (HappyAbsSyn ) -> (BoolExp)
happyOut18 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut18 #-}
happyIn19 :: (BoolExp) -> (HappyAbsSyn )
happyIn19 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn19 #-}
happyOut19 :: (HappyAbsSyn ) -> (BoolExp)
happyOut19 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut19 #-}
happyIn20 :: (BoolExp) -> (HappyAbsSyn )
happyIn20 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn20 #-}
happyOut20 :: (HappyAbsSyn ) -> (BoolExp)
happyOut20 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut20 #-}
happyIn21 :: (StringExp) -> (HappyAbsSyn )
happyIn21 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn21 #-}
happyOut21 :: (HappyAbsSyn ) -> (StringExp)
happyOut21 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut21 #-}
happyIn22 :: (StringExp) -> (HappyAbsSyn )
happyIn22 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn22 #-}
happyOut22 :: (HappyAbsSyn ) -> (StringExp)
happyOut22 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut22 #-}
happyIn23 :: (Literals) -> (HappyAbsSyn )
happyIn23 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn23 #-}
happyOut23 :: (HappyAbsSyn ) -> (Literals)
happyOut23 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut23 #-}
happyIn24 :: (Identifiers) -> (HappyAbsSyn )
happyIn24 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn24 #-}
happyOut24 :: (HappyAbsSyn ) -> (Identifiers)
happyOut24 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut24 #-}
happyIn25 :: (List) -> (HappyAbsSyn )
happyIn25 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn25 #-}
happyOut25 :: (HappyAbsSyn ) -> (List)
happyOut25 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut25 #-}
happyIn26 :: (Tuple) -> (HappyAbsSyn )
happyIn26 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn26 #-}
happyOut26 :: (HappyAbsSyn ) -> (Tuple)
happyOut26 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut26 #-}
happyInTok :: (Token) -> (HappyAbsSyn )
happyInTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn ) -> (Token)
happyOutTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOutTok #-}


happyExpList :: HappyAddr
happyExpList = HappyA# "\x00\x00\x00\x08\x00\xc0\x5d\x9a\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x44\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x77\x69\x02\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x04\x00\x03\x40\xc0\x01\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x08\x00\x0e\x80\x80\x03\x00\x00\x40\x00\x30\x00\x04\x1c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x65\x07\x00\x00\x00\x00\x00\x00\x84\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x01\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x18\x00\x02\x0e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x30\x00\x04\x1c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x65\x07\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x40\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x0c\x00\x01\x07\x00\x00\x80\x00\x60\x00\x00\x30\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x21\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\xc0\x01\x10\x70\x00\x00\x00\x08\x00\x0e\x80\x80\x03\x00\x00\x40\x00\x70\x00\x04\x1c\x00\x00\x00\x02\x00\x00\x00\xa0\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x14\x00\x01\x00\x00\x00\x00\x00\x04\x00\x00\x00\x40\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x04\x00\x07\x40\xc0\x01\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x08\x00\x06\x80\x80\x03\x00\x00\x40\x00\x00\xee\xd2\x04\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x80\x01\x00\xc0\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x50\x65\x07\x00\x00\x00\x00\x00\x00\x02\x00\x00\x20\x00\x00\x00\x00\x50\x40\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x60\x00\x00\x00\x10\x00\x00\x00\x00\x03\x00\x00\x80\x00\x00\x00\x00\x28\x00\x00\x00\x04\x00\x00\x00\x40\x01\x00\x00\x20\x00\x00\x00\x00\x0a\x00\x00\x00\x01\x00\x00\x00\x50\x00\x00\x00\x08\x00\x00\x00\x80\x02\x00\x00\x40\x00\x00\x00\x00\x14\x00\x00\x00\x02\x00\x00\x00\xa0\x00\x00\x00\x10\x00\x00\x00\x00\x05\x00\x00\x80\x00\x00\x00\x00\x28\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x18\x00\x02\x0e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x80\x02\x00\x00\x40\x00\x00\x00\x00\x14\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xa0\x00\x08\x00\x00\x00\x00\x00\x00\x05\x00\x00\x00\x00\x00\x00\x00\x28\x00\x00\x00\x00\x00\x00\x00\x40\x01\x00\x00\x00\x00\x00\x00\x00\x0a\x00\x00\x00\x00\x00\x00\x00\x50\x00\x00\x00\x00\x00\x00\x00\x40\x08\x00\x00\x00\x00\x00\x00\x00\x42\x00\x00\x00\x00\x00\x00\x00\xa0\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x80\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\xc0\x00\x00\x60\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x15\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x20\x00\x38\x00\x02\x0e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x40\x00\x00\x00\x00\x14\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x28\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x38\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\xa0\x00\x00\x00\xa0\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_pProgram","Ident","String","Integer","Program","Stmts","Stmt","BracedStmts","ParIdent","Literal","Boolean","Exp","IntExp","IntExp1","IntExp2","BoolExp","BoolExp1","BoolExp2","StringExp","StringExp1","Literals","Identifiers","List","Tuple","'!='","'('","')'","'*'","'+'","','","'-'","'.append('","'/'","'<'","'<='","'='","'=='","'>'","'>='","'False'","'True'","'['","']'","'and'","'break'","'continue'","'def'","'else'","'final'","'for'","'if'","'in'","'len'","'not'","'or'","'print'","'range'","'return'","'while'","'{'","'}'","L_ident","L_quoted","L_integ","%eof"]
        bit_start = st * 67
        bit_end = (st + 1) * 67
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..66]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\xd2\x00\x0a\x00\x00\x00\x6d\x00\x0f\x00\x00\x00\xd2\x00\x18\x00\x00\x00\x00\x00\x18\x00\x18\x00\x18\x00\xa3\x00\x45\x00\x52\x00\xa0\x00\xa3\x00\x26\x00\x00\x00\x00\x00\x00\x00\x31\x02\x88\x00\x00\x00\x36\x00\x43\x00\x00\x00\x27\x00\x00\x00\xa3\x00\x00\x00\x00\x00\xa3\x00\x00\x00\x00\x00\x4b\x00\x00\x00\x31\x02\x4d\x00\x27\x00\x00\x00\x00\x00\xb3\x00\xab\x00\x00\x00\x58\x00\x7c\x00\x36\x00\x7b\x00\x92\x00\xa2\x00\xa1\x00\xa7\x00\x00\x00\xa0\x00\xa0\x00\xa0\x00\x07\x00\x00\x00\x0c\x00\x07\x00\x00\x00\x86\x00\xba\x00\xbc\x00\xaa\x00\x9f\x00\x9f\x00\xa0\x00\x8d\x00\xb8\x00\xbe\x00\xd2\x00\xd4\x00\xe7\x00\x00\x00\x00\x00\xcf\x00\x00\x00\xe3\x00\x00\x00\xab\x00\x50\x00\x7a\x00\xfe\xff\x26\x02\x16\x00\xb5\x00\xf4\x00\x0b\x00\x0b\x00\x07\x00\x07\x00\x07\x00\x07\x00\x07\x00\x07\x00\x07\x00\x07\x00\x07\x00\x00\x00\xbe\x00\x00\x00\x07\x00\x07\x00\x00\x00\x00\x00\x00\x00\x54\x00\x93\x00\x93\x00\x93\x00\x93\x00\x93\x00\xea\x00\xea\x00\x93\x00\x00\x00\x07\x01\x0b\x00\x00\x00\x00\x00\x00\x00\x70\x00\x01\x00\x00\x00\xab\x00\x00\x00\x00\x00\xe8\x00\xff\x00\xf0\x00\x13\x01\x00\x00\x14\x01\x00\x00\xfe\x00\x00\x00\x00\x00\x3f\x01\x0a\x01\xa0\x00\x00\x00\xf6\x00\x07\x00\x00\x00\x00\x00\x00\x00\xb4\x00\x00\x00\xf8\x00\x00\x00\x00\x00\x07\x00\x56\x01\xf6\x00\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\x77\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xfc\x00\x22\x00\x00\x00\x00\x00\x25\x01\x2b\x01\x2c\x01\xb5\x01\x00\x00\x26\x01\xf9\x00\xc8\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x34\x01\x00\x00\x00\x00\x00\x00\x00\x00\xdb\x01\x00\x00\x00\x00\x01\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x01\x95\x01\x00\x00\x3b\x01\x2e\x01\x4b\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x27\x01\x3e\x01\x55\x01\x76\x00\x00\x00\x00\x00\xd6\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x2e\x00\x41\x01\x6c\x01\x00\x00\x00\x00\xee\x01\x2a\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x99\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x51\x00\xcc\x00\xae\x01\x70\x02\x73\x02\x37\x02\x45\x02\x48\x02\x4b\x02\x59\x02\x5c\x02\x00\x00\x14\x02\x00\x00\x37\x00\x5c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xdf\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x9e\x01\x00\x00\x00\x00\x00\x00\x00\x00\x4c\x01\x00\x00\x00\x00\x00\x00\x00\x00\x45\x01\x00\x00\x00\x00\x00\x00\x00\x00\x83\x01\x00\x00\x52\x01\x5f\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x6d\x02\x00\x00\x54\x01\x00\x00\x00\x00"#

happyAdjustOffset :: Happy_GHC_Exts.Int# -> Happy_GHC_Exts.Int#
happyAdjustOffset off = off

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\xfa\xff\x00\x00\xfe\xff\x00\x00\x00\x00\xfb\xff\xfa\xff\xb7\xff\xf2\xff\xf1\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd1\xff\xbc\xff\xd2\xff\xc1\xff\x00\x00\xd7\xff\xd4\xff\x00\x00\xce\xff\xcc\xff\x00\x00\xbe\xff\x00\x00\xe0\xff\xe1\xff\x00\x00\xfd\xff\xfc\xff\xd1\xff\xee\xff\xdf\xff\xdd\xff\xde\xff\xdc\xff\xdb\xff\xba\xff\xba\xff\xed\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xb5\xff\x00\x00\xf9\xff\x00\x00\x00\x00\x00\x00\x00\x00\xd1\xff\x00\x00\x00\x00\xf8\xff\xdb\xff\x00\x00\x00\x00\x00\x00\xb7\xff\x00\x00\x00\x00\x00\x00\xf6\xff\x00\x00\xfa\xff\x00\x00\x00\x00\xe5\xff\xe4\xff\xb8\xff\xe3\xff\x00\x00\xe2\xff\xba\xff\xbc\xff\xd2\xff\xe3\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xcb\xff\x00\x00\xf3\xff\x00\x00\x00\x00\xd5\xff\xd6\xff\xcd\xff\x00\x00\xc7\xff\xc8\xff\xc6\xff\xc9\xff\xca\xff\xd8\xff\xd9\xff\xc4\xff\xbd\xff\xc5\xff\x00\x00\xbf\xff\xb3\xff\xbb\xff\xc0\xff\xd0\xff\xb4\xff\xba\xff\xe6\xff\xeb\xff\x00\x00\xcf\xff\x00\x00\x00\x00\xf7\xff\x00\x00\xb6\xff\x00\x00\xf0\xff\xea\xff\x00\x00\x00\x00\x00\x00\xe8\xff\x00\x00\x00\x00\xf5\xff\xe7\xff\xb9\xff\x00\x00\xda\xff\x00\x00\xef\xff\xec\xff\x00\x00\x00\x00\x00\x00\xf4\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\x03\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\x06\x00\x07\x00\x02\x00\x09\x00\x0a\x00\x0b\x00\x02\x00\x0d\x00\x0e\x00\x0f\x00\x05\x00\x14\x00\x07\x00\x13\x00\x14\x00\x15\x00\x16\x00\x17\x00\x03\x00\x19\x00\x1a\x00\x1b\x00\x1f\x00\x1d\x00\x13\x00\x1f\x00\x20\x00\x00\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x02\x00\x03\x00\x29\x00\x05\x00\x05\x00\x26\x00\x00\x00\x28\x00\x26\x00\x26\x00\x27\x00\x0d\x00\x0d\x00\x1f\x00\x14\x00\x00\x00\x29\x00\x02\x00\x14\x00\x15\x00\x16\x00\x17\x00\x26\x00\x19\x00\x1a\x00\x1b\x00\x14\x00\x1d\x00\x0d\x00\x1f\x00\x20\x00\x02\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x02\x00\x03\x00\x29\x00\x05\x00\x00\x00\x01\x00\x03\x00\x02\x00\x1f\x00\x06\x00\x14\x00\x0d\x00\x05\x00\x24\x00\x07\x00\x00\x00\x12\x00\x02\x00\x14\x00\x15\x00\x16\x00\x17\x00\x12\x00\x19\x00\x1a\x00\x1b\x00\x13\x00\x1d\x00\x0d\x00\x1f\x00\x20\x00\x1f\x00\x22\x00\x23\x00\x02\x00\x25\x00\x26\x00\x02\x00\x03\x00\x29\x00\x08\x00\x00\x00\x00\x00\x02\x00\x0c\x00\x03\x00\x04\x00\x05\x00\x03\x00\x26\x00\x12\x00\x06\x00\x0b\x00\x0c\x00\x0d\x00\x14\x00\x15\x00\x16\x00\x17\x00\x02\x00\x19\x00\x1a\x00\x1b\x00\x04\x00\x1d\x00\x12\x00\x1f\x00\x20\x00\x09\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x1c\x00\x05\x00\x29\x00\x07\x00\x15\x00\x16\x00\x17\x00\x0c\x00\x19\x00\x1a\x00\x1b\x00\x02\x00\x1d\x00\x02\x00\x02\x00\x20\x00\x06\x00\x22\x00\x23\x00\x03\x00\x25\x00\x26\x00\x02\x00\x21\x00\x29\x00\x10\x00\x11\x00\x12\x00\x10\x00\x11\x00\x02\x00\x0c\x00\x03\x00\x03\x00\x05\x00\x05\x00\x10\x00\x11\x00\x03\x00\x1e\x00\x03\x00\x02\x00\x1e\x00\x0d\x00\x10\x00\x11\x00\x26\x00\x26\x00\x27\x00\x28\x00\x26\x00\x27\x00\x28\x00\x00\x00\x01\x00\x10\x00\x11\x00\x18\x00\x1e\x00\x27\x00\x28\x00\x02\x00\x06\x00\x00\x00\x03\x00\x02\x00\x26\x00\x27\x00\x28\x00\x1e\x00\x11\x00\x12\x00\x00\x00\x01\x00\x0b\x00\x0c\x00\x0d\x00\x26\x00\x27\x00\x28\x00\x15\x00\x16\x00\x17\x00\x03\x00\x19\x00\x1a\x00\x1b\x00\x04\x00\x1d\x00\x11\x00\x12\x00\x20\x00\x09\x00\x22\x00\x23\x00\x13\x00\x03\x00\x26\x00\x00\x00\x01\x00\x02\x00\x00\x00\x05\x00\x06\x00\x07\x00\x04\x00\x05\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x05\x00\x25\x00\x15\x00\x16\x00\x00\x00\x01\x00\x02\x00\x14\x00\x24\x00\x02\x00\x0c\x00\x03\x00\x08\x00\x09\x00\x24\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x26\x00\x00\x00\x16\x00\x00\x00\x01\x00\x02\x00\x00\x00\x00\x00\x00\x00\x07\x00\x04\x00\x05\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x06\x00\x00\x00\x15\x00\x16\x00\x00\x00\x01\x00\x02\x00\x00\x00\x03\x00\x15\x00\x05\x00\x00\x00\x07\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x06\x00\x06\x00\x15\x00\x16\x00\x00\x00\x01\x00\x02\x00\x06\x00\x03\x00\x06\x00\x05\x00\xff\xff\x07\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\xff\xff\xff\xff\x15\x00\x16\x00\x00\x00\x01\x00\x02\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\xff\xff\xff\xff\x15\x00\x16\x00\x00\x00\x01\x00\x02\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x01\x00\x02\x00\x15\x00\x16\x00\x01\x00\x02\x00\xff\xff\x08\x00\x09\x00\x01\x00\x02\x00\x08\x00\x09\x00\xff\xff\xff\xff\xff\xff\x08\x00\x09\x00\x13\x00\xff\xff\xff\xff\x16\x00\x13\x00\xff\xff\x00\x00\x16\x00\x02\x00\x13\x00\xff\xff\xff\xff\x16\x00\x00\x00\x01\x00\x02\x00\xff\xff\x0b\x00\x0c\x00\x0d\x00\xff\xff\xff\xff\x09\x00\xff\xff\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x00\x00\x01\x00\x02\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x09\x00\xff\xff\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x00\x00\x01\x00\x02\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x09\x00\xff\xff\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x00\x00\x01\x00\x02\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x09\x00\xff\xff\x0b\x00\x0c\x00\x0d\x00\xff\xff\x0f\x00\x10\x00\x11\x00\x12\x00\x00\x00\x01\x00\x02\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x09\x00\xff\xff\x0b\x00\x0c\x00\x0d\x00\xff\xff\xff\xff\x10\x00\x11\x00\x12\x00\x00\x00\x01\x00\x02\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x09\x00\xff\xff\x0b\x00\x0c\x00\x0d\x00\xff\xff\xff\xff\x10\x00\x11\x00\x12\x00\x01\x00\xff\xff\x03\x00\xff\xff\x05\x00\xff\xff\x07\x00\xff\xff\xff\xff\x0a\x00\x0b\x00\x01\x00\x0d\x00\x0e\x00\x0f\x00\x05\x00\x00\x00\x07\x00\x02\x00\xff\xff\x0a\x00\x0b\x00\xff\xff\x0d\x00\x0e\x00\x0f\x00\xff\xff\x0b\x00\x0c\x00\x0d\x00\x00\x00\xff\xff\x02\x00\x00\x00\xff\xff\x02\x00\x00\x00\xff\xff\x02\x00\xff\xff\xff\xff\x0b\x00\x0c\x00\x0d\x00\x0b\x00\x0c\x00\x0d\x00\x0b\x00\x0c\x00\x0d\x00\x00\x00\xff\xff\x02\x00\x00\x00\xff\xff\x02\x00\x00\x00\xff\xff\x02\x00\xff\xff\xff\xff\x0b\x00\x0c\x00\x0d\x00\x0b\x00\x0c\x00\x0d\x00\x0b\x00\x0c\x00\x0d\x00\x00\x00\xff\xff\x02\x00\x00\x00\xff\xff\x02\x00\x00\x00\xff\xff\x02\x00\xff\xff\xff\xff\x0b\x00\x0c\x00\x0d\x00\xff\xff\x0c\x00\x0d\x00\xff\xff\x0c\x00\x0d\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\xc1\xff\xd0\xff\xd0\xff\xd0\xff\xd0\xff\xd0\xff\xd0\xff\xd0\xff\x3e\x00\xd0\xff\xd0\xff\xd0\xff\x79\x00\xd0\xff\xd0\xff\xd0\xff\x5e\x00\xc1\xff\x5f\x00\xd0\xff\xd0\xff\xd0\xff\xd0\xff\xd0\xff\x7d\x00\xd0\xff\xd0\xff\xd0\xff\xc1\xff\xd0\xff\x8e\x00\xd0\xff\xd0\xff\x34\x00\xd0\xff\xd0\xff\xd0\xff\xd0\xff\xd0\xff\xc2\xff\xbd\xff\xd0\xff\xbd\xff\x5b\x00\x03\x00\x34\x00\x24\x00\x03\x00\x03\x00\x23\x00\xbd\xff\x5c\x00\x49\x00\x35\x00\x3b\x00\xff\xff\x14\x00\xc2\xff\xc2\xff\xc2\xff\xc2\xff\x03\x00\xc2\xff\xc2\xff\xc2\xff\x88\x00\xc2\xff\x6b\x00\xc2\xff\xc2\xff\x30\x00\xc2\xff\xc2\xff\xc2\xff\xc2\xff\xc2\xff\xbd\xff\xbd\xff\xc2\xff\xbd\xff\x76\x00\x13\x00\xbc\xff\x2f\x00\x49\x00\xe5\xff\x67\x00\xbd\xff\x5e\x00\x4a\x00\x5f\x00\x3b\x00\x65\x00\x14\x00\xc2\xff\xbd\xff\xbd\xff\xbd\xff\x79\x00\xbd\xff\xbd\xff\xbd\xff\x97\x00\xbd\xff\x6a\x00\xc2\xff\xbd\xff\x49\x00\xbd\xff\xbd\xff\x38\x00\xbd\xff\xbd\xff\xc0\xff\xc0\xff\xbd\xff\x39\x00\x3b\x00\x03\x00\x14\x00\x3a\x00\x04\x00\x05\x00\x06\x00\xd2\xff\x03\x00\x3b\x00\xe4\xff\x3c\x00\x17\x00\x18\x00\xc0\xff\xc0\xff\xc0\xff\xc0\xff\xdb\xff\xc0\xff\xc0\xff\xc0\xff\x69\x00\xc0\xff\x2d\x00\xc0\xff\xc0\xff\x6a\x00\xc0\xff\xc0\xff\xc0\xff\xc0\xff\xc0\xff\x47\x00\x5e\x00\xc0\xff\x5f\x00\xdb\xff\xdb\xff\xdb\xff\x46\x00\xdb\xff\xdb\xff\xdb\xff\x2c\x00\xdb\xff\x45\x00\x1f\x00\xdb\xff\x44\x00\xdb\xff\xdb\xff\x43\x00\xdb\xff\xdb\xff\x53\x00\x86\x00\xdb\xff\x20\x00\x21\x00\x2d\x00\x20\x00\x21\x00\x2c\x00\x8a\x00\x7c\x00\x7c\x00\x5b\x00\x5b\x00\x20\x00\x21\x00\x8c\x00\x22\x00\x8b\x00\x1f\x00\x22\x00\x5c\x00\x20\x00\x21\x00\x03\x00\x03\x00\x23\x00\x24\x00\x03\x00\x23\x00\x24\x00\x76\x00\x13\x00\x20\x00\x21\x00\x85\x00\x22\x00\x23\x00\x24\x00\x08\x00\x80\x00\x3b\x00\x82\x00\x14\x00\x03\x00\x23\x00\x24\x00\x22\x00\x77\x00\x1d\x00\x76\x00\x13\x00\x8c\x00\x17\x00\x18\x00\x03\x00\x23\x00\x24\x00\x09\x00\x0a\x00\x0b\x00\x81\x00\x0c\x00\x0d\x00\x0e\x00\x69\x00\x0f\x00\x95\x00\x1d\x00\x10\x00\x6a\x00\x11\x00\x12\x00\x7f\x00\x7b\x00\x03\x00\x24\x00\x13\x00\x14\x00\x03\x00\x5e\x00\x9b\x00\x5f\x00\x36\x00\x06\x00\x15\x00\x25\x00\x26\x00\x17\x00\x18\x00\x27\x00\x1a\x00\x1b\x00\x28\x00\x1d\x00\x5b\x00\x94\x00\x29\x00\x2a\x00\x12\x00\x53\x00\x54\x00\x67\x00\x4a\x00\x92\x00\x8f\x00\x91\x00\x4e\x00\x55\x00\x4a\x00\x56\x00\x17\x00\x18\x00\x57\x00\x1a\x00\x1b\x00\x58\x00\x1d\x00\x59\x00\x03\x00\x33\x00\x51\x00\x24\x00\x13\x00\x14\x00\x03\x00\x32\x00\x31\x00\x2d\x00\x82\x00\x06\x00\x15\x00\x41\x00\x26\x00\x17\x00\x18\x00\x27\x00\x1a\x00\x1b\x00\x28\x00\x1d\x00\x67\x00\x4b\x00\x29\x00\x2a\x00\x24\x00\x13\x00\x14\x00\x87\x00\x7e\x00\x4a\x00\x5e\x00\x8f\x00\x5f\x00\x15\x00\x40\x00\x26\x00\x17\x00\x18\x00\x27\x00\x1a\x00\x1b\x00\x28\x00\x1d\x00\x47\x00\x92\x00\x29\x00\x2a\x00\x24\x00\x13\x00\x14\x00\x98\x00\x9d\x00\x9d\x00\x5e\x00\x00\x00\x5f\x00\x15\x00\x3e\x00\x26\x00\x17\x00\x18\x00\x27\x00\x1a\x00\x1b\x00\x28\x00\x1d\x00\x00\x00\x00\x00\x29\x00\x3f\x00\x24\x00\x13\x00\x14\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x15\x00\x86\x00\x26\x00\x17\x00\x18\x00\x27\x00\x1a\x00\x1b\x00\x28\x00\x1d\x00\x00\x00\x00\x00\x29\x00\x2a\x00\x24\x00\x13\x00\x14\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x15\x00\x99\x00\x26\x00\x17\x00\x18\x00\x27\x00\x1a\x00\x1b\x00\x28\x00\x1d\x00\x4c\x00\x4d\x00\x29\x00\x2a\x00\x4c\x00\x4d\x00\x00\x00\x4e\x00\x4f\x00\x4c\x00\x4d\x00\x4e\x00\x4f\x00\x00\x00\x00\x00\x00\x00\x4e\x00\x4f\x00\x50\x00\x00\x00\x00\x00\x51\x00\x59\x00\x00\x00\x3b\x00\x51\x00\x14\x00\x94\x00\x00\x00\x00\x00\x51\x00\x12\x00\x13\x00\x14\x00\x00\x00\x75\x00\x17\x00\x18\x00\x00\x00\x00\x00\x15\x00\x00\x00\x16\x00\x17\x00\x18\x00\x30\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x12\x00\x13\x00\x14\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x15\x00\x00\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x12\x00\x13\x00\x14\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x15\x00\x00\x00\x56\x00\x17\x00\x18\x00\x57\x00\x1a\x00\x1b\x00\x58\x00\x1d\x00\x12\x00\x13\x00\x14\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x15\x00\x00\x00\x16\x00\x17\x00\x18\x00\x00\x00\x83\x00\x1b\x00\x1c\x00\x1d\x00\x12\x00\x13\x00\x14\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x15\x00\x00\x00\x16\x00\x17\x00\x18\x00\x00\x00\x00\x00\x65\x00\x1c\x00\x1d\x00\x12\x00\x13\x00\x14\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x15\x00\x00\x00\x16\x00\x17\x00\x18\x00\x00\x00\x00\x00\x6c\x00\x1c\x00\x1d\x00\x5d\x00\x00\x00\x7e\x00\x00\x00\x5e\x00\x00\x00\x5f\x00\x00\x00\x00\x00\x60\x00\x61\x00\x5d\x00\x62\x00\x63\x00\x64\x00\x5e\x00\x3b\x00\x5f\x00\x14\x00\x00\x00\x60\x00\x61\x00\x00\x00\x62\x00\x63\x00\x64\x00\x00\x00\x72\x00\x17\x00\x18\x00\x3b\x00\x00\x00\x14\x00\x3b\x00\x00\x00\x14\x00\x3b\x00\x00\x00\x14\x00\x00\x00\x00\x00\x71\x00\x17\x00\x18\x00\x70\x00\x17\x00\x18\x00\x6f\x00\x17\x00\x18\x00\x3b\x00\x00\x00\x14\x00\x3b\x00\x00\x00\x14\x00\x3b\x00\x00\x00\x14\x00\x00\x00\x00\x00\x6e\x00\x17\x00\x18\x00\x6d\x00\x17\x00\x18\x00\x97\x00\x17\x00\x18\x00\x3b\x00\x00\x00\x14\x00\x3b\x00\x00\x00\x14\x00\x3b\x00\x00\x00\x14\x00\x00\x00\x00\x00\x9b\x00\x17\x00\x18\x00\x00\x00\x74\x00\x18\x00\x00\x00\x73\x00\x18\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (1, 76) [
	(1 , happyReduce_1),
	(2 , happyReduce_2),
	(3 , happyReduce_3),
	(4 , happyReduce_4),
	(5 , happyReduce_5),
	(6 , happyReduce_6),
	(7 , happyReduce_7),
	(8 , happyReduce_8),
	(9 , happyReduce_9),
	(10 , happyReduce_10),
	(11 , happyReduce_11),
	(12 , happyReduce_12),
	(13 , happyReduce_13),
	(14 , happyReduce_14),
	(15 , happyReduce_15),
	(16 , happyReduce_16),
	(17 , happyReduce_17),
	(18 , happyReduce_18),
	(19 , happyReduce_19),
	(20 , happyReduce_20),
	(21 , happyReduce_21),
	(22 , happyReduce_22),
	(23 , happyReduce_23),
	(24 , happyReduce_24),
	(25 , happyReduce_25),
	(26 , happyReduce_26),
	(27 , happyReduce_27),
	(28 , happyReduce_28),
	(29 , happyReduce_29),
	(30 , happyReduce_30),
	(31 , happyReduce_31),
	(32 , happyReduce_32),
	(33 , happyReduce_33),
	(34 , happyReduce_34),
	(35 , happyReduce_35),
	(36 , happyReduce_36),
	(37 , happyReduce_37),
	(38 , happyReduce_38),
	(39 , happyReduce_39),
	(40 , happyReduce_40),
	(41 , happyReduce_41),
	(42 , happyReduce_42),
	(43 , happyReduce_43),
	(44 , happyReduce_44),
	(45 , happyReduce_45),
	(46 , happyReduce_46),
	(47 , happyReduce_47),
	(48 , happyReduce_48),
	(49 , happyReduce_49),
	(50 , happyReduce_50),
	(51 , happyReduce_51),
	(52 , happyReduce_52),
	(53 , happyReduce_53),
	(54 , happyReduce_54),
	(55 , happyReduce_55),
	(56 , happyReduce_56),
	(57 , happyReduce_57),
	(58 , happyReduce_58),
	(59 , happyReduce_59),
	(60 , happyReduce_60),
	(61 , happyReduce_61),
	(62 , happyReduce_62),
	(63 , happyReduce_63),
	(64 , happyReduce_64),
	(65 , happyReduce_65),
	(66 , happyReduce_66),
	(67 , happyReduce_67),
	(68 , happyReduce_68),
	(69 , happyReduce_69),
	(70 , happyReduce_70),
	(71 , happyReduce_71),
	(72 , happyReduce_72),
	(73 , happyReduce_73),
	(74 , happyReduce_74),
	(75 , happyReduce_75),
	(76 , happyReduce_76)
	]

happy_n_terms = 42 :: Int
happy_n_nonterms = 23 :: Int

happyReduce_1 = happySpecReduce_1  0# happyReduction_1
happyReduction_1 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (TV happy_var_1)) -> 
	happyIn4
		 (Ident happy_var_1
	)}

happyReduce_2 = happySpecReduce_1  1# happyReduction_2
happyReduction_2 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (TL happy_var_1)) -> 
	happyIn5
		 (happy_var_1
	)}

happyReduce_3 = happySpecReduce_1  2# happyReduction_3
happyReduction_3 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (TI happy_var_1)) -> 
	happyIn6
		 ((read ( happy_var_1)) :: Integer
	)}

happyReduce_4 = happySpecReduce_1  3# happyReduction_4
happyReduction_4 happy_x_1
	 =  case happyOut8 happy_x_1 of { happy_var_1 -> 
	happyIn7
		 (AbsGrammar.SProgram happy_var_1
	)}

happyReduce_5 = happySpecReduce_0  4# happyReduction_5
happyReduction_5  =  happyIn8
		 (AbsGrammar.StmtsNull
	)

happyReduce_6 = happySpecReduce_2  4# happyReduction_6
happyReduction_6 happy_x_2
	happy_x_1
	 =  case happyOut9 happy_x_1 of { happy_var_1 -> 
	case happyOut8 happy_x_2 of { happy_var_2 -> 
	happyIn8
		 (AbsGrammar.SStmts happy_var_1 happy_var_2
	)}}

happyReduce_7 = happySpecReduce_3  5# happyReduction_7
happyReduction_7 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut4 happy_x_1 of { happy_var_1 -> 
	case happyOut14 happy_x_3 of { happy_var_3 -> 
	happyIn9
		 (AbsGrammar.Assign happy_var_1 happy_var_3
	)}}

happyReduce_8 = happyReduce 4# 5# happyReduction_8
happyReduction_8 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut4 happy_x_2 of { happy_var_2 -> 
	case happyOut14 happy_x_4 of { happy_var_4 -> 
	happyIn9
		 (AbsGrammar.ConstAssign happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_9 = happySpecReduce_3  5# happyReduction_9
happyReduction_9 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut18 happy_x_2 of { happy_var_2 -> 
	case happyOut10 happy_x_3 of { happy_var_3 -> 
	happyIn9
		 (AbsGrammar.If happy_var_2 happy_var_3
	)}}

happyReduce_10 = happyReduce 5# 5# happyReduction_10
happyReduction_10 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut18 happy_x_2 of { happy_var_2 -> 
	case happyOut10 happy_x_3 of { happy_var_3 -> 
	case happyOut10 happy_x_5 of { happy_var_5 -> 
	happyIn9
		 (AbsGrammar.IfElse happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest}}}

happyReduce_11 = happyReduce 10# 5# happyReduction_11
happyReduction_11 (happy_x_10 `HappyStk`
	happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut4 happy_x_2 of { happy_var_2 -> 
	case happyOut15 happy_x_6 of { happy_var_6 -> 
	case happyOut15 happy_x_8 of { happy_var_8 -> 
	case happyOut10 happy_x_10 of { happy_var_10 -> 
	happyIn9
		 (AbsGrammar.For happy_var_2 happy_var_6 happy_var_8 happy_var_10
	) `HappyStk` happyRest}}}}

happyReduce_12 = happySpecReduce_3  5# happyReduction_12
happyReduction_12 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut18 happy_x_2 of { happy_var_2 -> 
	case happyOut10 happy_x_3 of { happy_var_3 -> 
	happyIn9
		 (AbsGrammar.While happy_var_2 happy_var_3
	)}}

happyReduce_13 = happySpecReduce_1  5# happyReduction_13
happyReduction_13 happy_x_1
	 =  happyIn9
		 (AbsGrammar.Break
	)

happyReduce_14 = happySpecReduce_1  5# happyReduction_14
happyReduction_14 happy_x_1
	 =  happyIn9
		 (AbsGrammar.Continue
	)

happyReduce_15 = happyReduce 4# 5# happyReduction_15
happyReduction_15 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut4 happy_x_1 of { happy_var_1 -> 
	case happyOut14 happy_x_3 of { happy_var_3 -> 
	happyIn9
		 (AbsGrammar.FuncCall happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_16 = happyReduce 6# 5# happyReduction_16
happyReduction_16 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut4 happy_x_2 of { happy_var_2 -> 
	case happyOut4 happy_x_4 of { happy_var_4 -> 
	case happyOut10 happy_x_6 of { happy_var_6 -> 
	happyIn9
		 (AbsGrammar.FuncDecl happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest}}}

happyReduce_17 = happySpecReduce_2  5# happyReduction_17
happyReduction_17 happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_2 of { happy_var_2 -> 
	happyIn9
		 (AbsGrammar.Return happy_var_2
	)}

happyReduce_18 = happySpecReduce_2  5# happyReduction_18
happyReduction_18 happy_x_2
	happy_x_1
	 =  case happyOut11 happy_x_2 of { happy_var_2 -> 
	happyIn9
		 (AbsGrammar.Print happy_var_2
	)}

happyReduce_19 = happyReduce 6# 5# happyReduction_19
happyReduction_19 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut4 happy_x_1 of { happy_var_1 -> 
	case happyOut15 happy_x_3 of { happy_var_3 -> 
	case happyOut14 happy_x_6 of { happy_var_6 -> 
	happyIn9
		 (AbsGrammar.AssignListElem happy_var_1 happy_var_3 happy_var_6
	) `HappyStk` happyRest}}}

happyReduce_20 = happyReduce 4# 5# happyReduction_20
happyReduction_20 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut25 happy_x_3 of { happy_var_3 -> 
	happyIn9
		 (AbsGrammar.GetListSize happy_var_3
	) `HappyStk` happyRest}

happyReduce_21 = happyReduce 4# 5# happyReduction_21
happyReduction_21 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut4 happy_x_1 of { happy_var_1 -> 
	case happyOut14 happy_x_3 of { happy_var_3 -> 
	happyIn9
		 (AbsGrammar.AppendListElem happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_22 = happySpecReduce_3  5# happyReduction_22
happyReduction_22 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut4 happy_x_1 of { happy_var_1 -> 
	case happyOut26 happy_x_3 of { happy_var_3 -> 
	happyIn9
		 (AbsGrammar.AssignTuple happy_var_1 happy_var_3
	)}}

happyReduce_23 = happyReduce 5# 5# happyReduction_23
happyReduction_23 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut24 happy_x_2 of { happy_var_2 -> 
	case happyOut4 happy_x_5 of { happy_var_5 -> 
	happyIn9
		 (AbsGrammar.SExtract happy_var_2 happy_var_5
	) `HappyStk` happyRest}}

happyReduce_24 = happySpecReduce_3  6# happyReduction_24
happyReduction_24 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_2 of { happy_var_2 -> 
	happyIn10
		 (AbsGrammar.SBracedStmts happy_var_2
	)}

happyReduce_25 = happySpecReduce_3  7# happyReduction_25
happyReduction_25 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut4 happy_x_2 of { happy_var_2 -> 
	happyIn11
		 (AbsGrammar.SParIdent happy_var_2
	)}

happyReduce_26 = happySpecReduce_1  8# happyReduction_26
happyReduction_26 happy_x_1
	 =  case happyOut5 happy_x_1 of { happy_var_1 -> 
	happyIn12
		 (AbsGrammar.LiteralStr happy_var_1
	)}

happyReduce_27 = happySpecReduce_1  8# happyReduction_27
happyReduction_27 happy_x_1
	 =  case happyOut6 happy_x_1 of { happy_var_1 -> 
	happyIn12
		 (AbsGrammar.LiteralInt happy_var_1
	)}

happyReduce_28 = happySpecReduce_1  8# happyReduction_28
happyReduction_28 happy_x_1
	 =  case happyOut13 happy_x_1 of { happy_var_1 -> 
	happyIn12
		 (AbsGrammar.LiteralBool happy_var_1
	)}

happyReduce_29 = happySpecReduce_1  8# happyReduction_29
happyReduction_29 happy_x_1
	 =  case happyOut26 happy_x_1 of { happy_var_1 -> 
	happyIn12
		 (AbsGrammar.LiteralTuple happy_var_1
	)}

happyReduce_30 = happySpecReduce_1  9# happyReduction_30
happyReduction_30 happy_x_1
	 =  happyIn13
		 (AbsGrammar.BoolTrue
	)

happyReduce_31 = happySpecReduce_1  9# happyReduction_31
happyReduction_31 happy_x_1
	 =  happyIn13
		 (AbsGrammar.BoolFalse
	)

happyReduce_32 = happySpecReduce_1  10# happyReduction_32
happyReduction_32 happy_x_1
	 =  case happyOut15 happy_x_1 of { happy_var_1 -> 
	happyIn14
		 (AbsGrammar.ExpInt happy_var_1
	)}

happyReduce_33 = happySpecReduce_1  10# happyReduction_33
happyReduction_33 happy_x_1
	 =  case happyOut21 happy_x_1 of { happy_var_1 -> 
	happyIn14
		 (AbsGrammar.ExpString happy_var_1
	)}

happyReduce_34 = happySpecReduce_1  10# happyReduction_34
happyReduction_34 happy_x_1
	 =  case happyOut18 happy_x_1 of { happy_var_1 -> 
	happyIn14
		 (AbsGrammar.ExpBool happy_var_1
	)}

happyReduce_35 = happySpecReduce_1  10# happyReduction_35
happyReduction_35 happy_x_1
	 =  case happyOut25 happy_x_1 of { happy_var_1 -> 
	happyIn14
		 (AbsGrammar.ExpList happy_var_1
	)}

happyReduce_36 = happySpecReduce_1  10# happyReduction_36
happyReduction_36 happy_x_1
	 =  case happyOut26 happy_x_1 of { happy_var_1 -> 
	happyIn14
		 (AbsGrammar.ExpTuple happy_var_1
	)}

happyReduce_37 = happyReduce 4# 10# happyReduction_37
happyReduction_37 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut4 happy_x_1 of { happy_var_1 -> 
	case happyOut15 happy_x_3 of { happy_var_3 -> 
	happyIn14
		 (AbsGrammar.GetListElem happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_38 = happySpecReduce_3  11# happyReduction_38
happyReduction_38 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_1 of { happy_var_1 -> 
	case happyOut16 happy_x_3 of { happy_var_3 -> 
	happyIn15
		 (AbsGrammar.IntAdd happy_var_1 happy_var_3
	)}}

happyReduce_39 = happySpecReduce_3  11# happyReduction_39
happyReduction_39 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_1 of { happy_var_1 -> 
	case happyOut16 happy_x_3 of { happy_var_3 -> 
	happyIn15
		 (AbsGrammar.IntSub happy_var_1 happy_var_3
	)}}

happyReduce_40 = happySpecReduce_1  11# happyReduction_40
happyReduction_40 happy_x_1
	 =  case happyOut16 happy_x_1 of { happy_var_1 -> 
	happyIn15
		 (happy_var_1
	)}

happyReduce_41 = happySpecReduce_3  12# happyReduction_41
happyReduction_41 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut16 happy_x_1 of { happy_var_1 -> 
	case happyOut17 happy_x_3 of { happy_var_3 -> 
	happyIn16
		 (AbsGrammar.IntMult happy_var_1 happy_var_3
	)}}

happyReduce_42 = happySpecReduce_3  12# happyReduction_42
happyReduction_42 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut16 happy_x_1 of { happy_var_1 -> 
	case happyOut17 happy_x_3 of { happy_var_3 -> 
	happyIn16
		 (AbsGrammar.IntDiv happy_var_1 happy_var_3
	)}}

happyReduce_43 = happySpecReduce_1  12# happyReduction_43
happyReduction_43 happy_x_1
	 =  case happyOut17 happy_x_1 of { happy_var_1 -> 
	happyIn16
		 (happy_var_1
	)}

happyReduce_44 = happySpecReduce_3  13# happyReduction_44
happyReduction_44 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_2 of { happy_var_2 -> 
	happyIn17
		 (AbsGrammar.IntPare happy_var_2
	)}

happyReduce_45 = happySpecReduce_1  13# happyReduction_45
happyReduction_45 happy_x_1
	 =  case happyOut6 happy_x_1 of { happy_var_1 -> 
	happyIn17
		 (AbsGrammar.IntLit happy_var_1
	)}

happyReduce_46 = happySpecReduce_1  13# happyReduction_46
happyReduction_46 happy_x_1
	 =  case happyOut4 happy_x_1 of { happy_var_1 -> 
	happyIn17
		 (AbsGrammar.IntIdent happy_var_1
	)}

happyReduce_47 = happySpecReduce_3  13# happyReduction_47
happyReduction_47 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_2 of { happy_var_2 -> 
	happyIn17
		 (happy_var_2
	)}

happyReduce_48 = happySpecReduce_3  14# happyReduction_48
happyReduction_48 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut18 happy_x_1 of { happy_var_1 -> 
	case happyOut19 happy_x_3 of { happy_var_3 -> 
	happyIn18
		 (AbsGrammar.BoolOr happy_var_1 happy_var_3
	)}}

happyReduce_49 = happySpecReduce_1  14# happyReduction_49
happyReduction_49 happy_x_1
	 =  case happyOut19 happy_x_1 of { happy_var_1 -> 
	happyIn18
		 (happy_var_1
	)}

happyReduce_50 = happySpecReduce_3  15# happyReduction_50
happyReduction_50 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut19 happy_x_1 of { happy_var_1 -> 
	case happyOut20 happy_x_3 of { happy_var_3 -> 
	happyIn19
		 (AbsGrammar.BoolAnd happy_var_1 happy_var_3
	)}}

happyReduce_51 = happySpecReduce_1  15# happyReduction_51
happyReduction_51 happy_x_1
	 =  case happyOut20 happy_x_1 of { happy_var_1 -> 
	happyIn19
		 (happy_var_1
	)}

happyReduce_52 = happySpecReduce_2  16# happyReduction_52
happyReduction_52 happy_x_2
	happy_x_1
	 =  case happyOut20 happy_x_2 of { happy_var_2 -> 
	happyIn20
		 (AbsGrammar.BoolNot happy_var_2
	)}

happyReduce_53 = happySpecReduce_3  16# happyReduction_53
happyReduction_53 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_1 of { happy_var_1 -> 
	case happyOut15 happy_x_3 of { happy_var_3 -> 
	happyIn20
		 (AbsGrammar.BoolIsSmaller happy_var_1 happy_var_3
	)}}

happyReduce_54 = happySpecReduce_3  16# happyReduction_54
happyReduction_54 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_1 of { happy_var_1 -> 
	case happyOut15 happy_x_3 of { happy_var_3 -> 
	happyIn20
		 (AbsGrammar.BoolSmallerOrEq happy_var_1 happy_var_3
	)}}

happyReduce_55 = happySpecReduce_3  16# happyReduction_55
happyReduction_55 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_1 of { happy_var_1 -> 
	case happyOut15 happy_x_3 of { happy_var_3 -> 
	happyIn20
		 (AbsGrammar.BoolGreater happy_var_1 happy_var_3
	)}}

happyReduce_56 = happySpecReduce_3  16# happyReduction_56
happyReduction_56 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_1 of { happy_var_1 -> 
	case happyOut15 happy_x_3 of { happy_var_3 -> 
	happyIn20
		 (AbsGrammar.BoolGreaterOrEq happy_var_1 happy_var_3
	)}}

happyReduce_57 = happySpecReduce_3  16# happyReduction_57
happyReduction_57 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_1 of { happy_var_1 -> 
	case happyOut15 happy_x_3 of { happy_var_3 -> 
	happyIn20
		 (AbsGrammar.BoolEqual happy_var_1 happy_var_3
	)}}

happyReduce_58 = happySpecReduce_3  16# happyReduction_58
happyReduction_58 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut21 happy_x_1 of { happy_var_1 -> 
	case happyOut21 happy_x_3 of { happy_var_3 -> 
	happyIn20
		 (AbsGrammar.BoolEqual2 happy_var_1 happy_var_3
	)}}

happyReduce_59 = happySpecReduce_3  16# happyReduction_59
happyReduction_59 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_1 of { happy_var_1 -> 
	case happyOut15 happy_x_3 of { happy_var_3 -> 
	happyIn20
		 (AbsGrammar.BoolNotEqual happy_var_1 happy_var_3
	)}}

happyReduce_60 = happySpecReduce_3  16# happyReduction_60
happyReduction_60 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut18 happy_x_2 of { happy_var_2 -> 
	happyIn20
		 (AbsGrammar.BoolPare happy_var_2
	)}

happyReduce_61 = happySpecReduce_1  16# happyReduction_61
happyReduction_61 happy_x_1
	 =  case happyOut4 happy_x_1 of { happy_var_1 -> 
	happyIn20
		 (AbsGrammar.BoolIdent happy_var_1
	)}

happyReduce_62 = happySpecReduce_1  16# happyReduction_62
happyReduction_62 happy_x_1
	 =  case happyOut13 happy_x_1 of { happy_var_1 -> 
	happyIn20
		 (AbsGrammar.BoolLit happy_var_1
	)}

happyReduce_63 = happySpecReduce_3  16# happyReduction_63
happyReduction_63 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut18 happy_x_2 of { happy_var_2 -> 
	happyIn20
		 (happy_var_2
	)}

happyReduce_64 = happySpecReduce_3  17# happyReduction_64
happyReduction_64 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut21 happy_x_1 of { happy_var_1 -> 
	case happyOut22 happy_x_3 of { happy_var_3 -> 
	happyIn21
		 (AbsGrammar.StringConcat happy_var_1 happy_var_3
	)}}

happyReduce_65 = happySpecReduce_1  17# happyReduction_65
happyReduction_65 happy_x_1
	 =  case happyOut22 happy_x_1 of { happy_var_1 -> 
	happyIn21
		 (happy_var_1
	)}

happyReduce_66 = happySpecReduce_1  18# happyReduction_66
happyReduction_66 happy_x_1
	 =  case happyOut4 happy_x_1 of { happy_var_1 -> 
	happyIn22
		 (AbsGrammar.StringIdent happy_var_1
	)}

happyReduce_67 = happySpecReduce_1  18# happyReduction_67
happyReduction_67 happy_x_1
	 =  case happyOut5 happy_x_1 of { happy_var_1 -> 
	happyIn22
		 (AbsGrammar.StringLit happy_var_1
	)}

happyReduce_68 = happySpecReduce_3  18# happyReduction_68
happyReduction_68 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut21 happy_x_2 of { happy_var_2 -> 
	happyIn22
		 (happy_var_2
	)}

happyReduce_69 = happySpecReduce_0  19# happyReduction_69
happyReduction_69  =  happyIn23
		 (AbsGrammar.SLitNull
	)

happyReduce_70 = happySpecReduce_3  19# happyReduction_70
happyReduction_70 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut12 happy_x_1 of { happy_var_1 -> 
	case happyOut23 happy_x_3 of { happy_var_3 -> 
	happyIn23
		 (AbsGrammar.SLit happy_var_1 happy_var_3
	)}}

happyReduce_71 = happySpecReduce_1  19# happyReduction_71
happyReduction_71 happy_x_1
	 =  case happyOut12 happy_x_1 of { happy_var_1 -> 
	happyIn23
		 (AbsGrammar.SLitSingle happy_var_1
	)}

happyReduce_72 = happySpecReduce_0  20# happyReduction_72
happyReduction_72  =  happyIn24
		 (AbsGrammar.SIdentNull
	)

happyReduce_73 = happySpecReduce_3  20# happyReduction_73
happyReduction_73 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut4 happy_x_1 of { happy_var_1 -> 
	case happyOut24 happy_x_3 of { happy_var_3 -> 
	happyIn24
		 (AbsGrammar.SIdent happy_var_1 happy_var_3
	)}}

happyReduce_74 = happySpecReduce_1  20# happyReduction_74
happyReduction_74 happy_x_1
	 =  case happyOut4 happy_x_1 of { happy_var_1 -> 
	happyIn24
		 (AbsGrammar.SIdentSingle happy_var_1
	)}

happyReduce_75 = happySpecReduce_3  21# happyReduction_75
happyReduction_75 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_2 of { happy_var_2 -> 
	happyIn25
		 (AbsGrammar.SList happy_var_2
	)}

happyReduce_76 = happySpecReduce_3  22# happyReduction_76
happyReduction_76 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_2 of { happy_var_2 -> 
	happyIn26
		 (AbsGrammar.STuple happy_var_2
	)}

happyNewToken action sts stk [] =
	happyDoAction 41# notHappyAtAll action sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = happyDoAction i tk action sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 1#;
	PT _ (TS _ 2) -> cont 2#;
	PT _ (TS _ 3) -> cont 3#;
	PT _ (TS _ 4) -> cont 4#;
	PT _ (TS _ 5) -> cont 5#;
	PT _ (TS _ 6) -> cont 6#;
	PT _ (TS _ 7) -> cont 7#;
	PT _ (TS _ 8) -> cont 8#;
	PT _ (TS _ 9) -> cont 9#;
	PT _ (TS _ 10) -> cont 10#;
	PT _ (TS _ 11) -> cont 11#;
	PT _ (TS _ 12) -> cont 12#;
	PT _ (TS _ 13) -> cont 13#;
	PT _ (TS _ 14) -> cont 14#;
	PT _ (TS _ 15) -> cont 15#;
	PT _ (TS _ 16) -> cont 16#;
	PT _ (TS _ 17) -> cont 17#;
	PT _ (TS _ 18) -> cont 18#;
	PT _ (TS _ 19) -> cont 19#;
	PT _ (TS _ 20) -> cont 20#;
	PT _ (TS _ 21) -> cont 21#;
	PT _ (TS _ 22) -> cont 22#;
	PT _ (TS _ 23) -> cont 23#;
	PT _ (TS _ 24) -> cont 24#;
	PT _ (TS _ 25) -> cont 25#;
	PT _ (TS _ 26) -> cont 26#;
	PT _ (TS _ 27) -> cont 27#;
	PT _ (TS _ 28) -> cont 28#;
	PT _ (TS _ 29) -> cont 29#;
	PT _ (TS _ 30) -> cont 30#;
	PT _ (TS _ 31) -> cont 31#;
	PT _ (TS _ 32) -> cont 32#;
	PT _ (TS _ 33) -> cont 33#;
	PT _ (TS _ 34) -> cont 34#;
	PT _ (TS _ 35) -> cont 35#;
	PT _ (TS _ 36) -> cont 36#;
	PT _ (TS _ 37) -> cont 37#;
	PT _ (TV happy_dollar_dollar) -> cont 38#;
	PT _ (TL happy_dollar_dollar) -> cont 39#;
	PT _ (TI happy_dollar_dollar) -> cont 40#;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 41# tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

happyThen :: () => Err a -> (a -> Err b) -> Err b
happyThen = (thenM)
happyReturn :: () => a -> Err a
happyReturn = (returnM)
happyThen1 m k tks = (thenM) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> Err a
happyReturn1 = \a tks -> (returnM) a
happyError' :: () => ([(Token)], [String]) -> Err a
happyError' = (\(tokens, _) -> happyError tokens)
pProgram tks = happySomeParser where
 happySomeParser = happyThen (happyParse 0# tks) (\x -> happyReturn (happyOut7 x))

happySeq = happyDontSeq


returnM :: a -> Err a
returnM = return

thenM :: Err a -> (a -> Err b) -> Err b
thenM = (>>=)

happyError :: [Token] -> Err a
happyError ts =
  Bad $ "syntax error at " ++ tokenPos ts ++ 
  case ts of
    [] -> []
    [Err _] -> " due to lexer error"
    t:_ -> " before `" ++ id(prToken t) ++ "'"

myLexer = tokens
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 11 "<command-line>" #-}
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4














































{-# LINE 11 "<command-line>" #-}
{-# LINE 1 "/usr/lib/ghc/include/ghcversion.h" #-}

















{-# LINE 11 "<command-line>" #-}
{-# LINE 1 "/tmp/ghcb5f8_0/ghc_2.h" #-}




























































































































































{-# LINE 11 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 













-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#if __GLASGOW_HASKELL__ > 706
#define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Bool)
#define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Bool)
#define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Bool)
#else
#define LT(n,m) (n Happy_GHC_Exts.<# m)
#define GTE(n,m) (n Happy_GHC_Exts.>=# m)
#define EQ(n,m) (n Happy_GHC_Exts.==# m)
#endif
{-# LINE 43 "templates/GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList







{-# LINE 65 "templates/GenericTemplate.hs" #-}

{-# LINE 75 "templates/GenericTemplate.hs" #-}

{-# LINE 84 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is 0#, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 0# tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
        (happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



happyDoAction i tk st
        = {- nothing -}


          case action of
                0#           -> {- nothing -}
                                     happyFail (happyExpListPerState ((Happy_GHC_Exts.I# (st)) :: Int)) i tk st
                -1#          -> {- nothing -}
                                     happyAccept i tk st
                n | LT(n,(0# :: Happy_GHC_Exts.Int#)) -> {- nothing -}

                                                   (happyReduceArr Happy_Data_Array.! rule) i tk st
                                                   where rule = (Happy_GHC_Exts.I# ((Happy_GHC_Exts.negateInt# ((n Happy_GHC_Exts.+# (1# :: Happy_GHC_Exts.Int#))))))
                n                 -> {- nothing -}


                                     happyShift new_state i tk st
                                     where new_state = (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#))
   where off    = happyAdjustOffset (indexShortOffAddr happyActOffsets st)
         off_i  = (off Happy_GHC_Exts.+#  i)
         check  = if GTE(off_i,(0# :: Happy_GHC_Exts.Int#))
                  then EQ(indexShortOffAddr happyCheck off_i, i)
                  else False
         action
          | check     = indexShortOffAddr happyTable off_i
          | otherwise = indexShortOffAddr happyDefActions st




indexShortOffAddr (HappyA# arr) off =
        Happy_GHC_Exts.narrow16Int# i
  where
        i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.uncheckedShiftL# high 8#) low)
        high = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr (off' Happy_GHC_Exts.+# 1#)))
        low  = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr off'))
        off' = off Happy_GHC_Exts.*# 2#




{-# INLINE happyLt #-}
happyLt x y = LT(x,y)


readArrayBit arr bit =
    Bits.testBit (Happy_GHC_Exts.I# (indexShortOffAddr arr ((unbox_int bit) `Happy_GHC_Exts.iShiftRA#` 4#))) (bit `mod` 16)
  where unbox_int (Happy_GHC_Exts.I# x) = x






data HappyAddr = HappyA# Happy_GHC_Exts.Addr#


-----------------------------------------------------------------------------
-- HappyState data type (not arrays)

{-# LINE 180 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 0# tk st sts stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons (st) (sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons (st) (sts)) ((happyInTok (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_0 nt fn j tk st@((action)) sts stk
     = happyGoto nt j tk st (HappyCons (st) (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@((HappyCons (st@(action)) (_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_2 nt fn j tk _ (HappyCons (_) (sts@((HappyCons (st@(action)) (_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_3 nt fn j tk _ (HappyCons (_) ((HappyCons (_) (sts@((HappyCons (st@(action)) (_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
         sts1@((HappyCons (st1@(action)) (_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
         let drop_stk = happyDropStk k stk

             off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st1)
             off_i = (off Happy_GHC_Exts.+#  nt)
             new_state = indexShortOffAddr happyTable off_i




          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l = l
happyDrop n (HappyCons (_) (t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction


happyGoto nt j tk st = 
   {- nothing -}
   happyDoAction j tk new_state
   where off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st)
         off_i = (off Happy_GHC_Exts.+#  nt)
         new_state = indexShortOffAddr happyTable off_i




-----------------------------------------------------------------------------
-- Error recovery (0# is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist 0# tk old_st _ stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  0# tk old_st (HappyCons ((action)) (sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        happyDoAction 0# tk action sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (action) sts stk =
--      trace "entering error recovery" $
        happyDoAction 0# tk action sts ( (Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.


{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
