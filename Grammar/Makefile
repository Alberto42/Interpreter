JAVAC=javac
JAVAC_FLAGS=-sourcepath .
JAVA=java
JAVA_FLAGS=
PARSER=${JAVA} ${JAVA_FLAGS} java_cup.Main
PARSER_FLAGS=-nopositions -expect 100
LEXER=${JAVA} ${JAVA_FLAGS} JLex.Main
LEXER_FLAGS=
all: test

test: absyn grammar/Yylex.class grammar/PrettyPrinter.class grammar/Test.class grammar/ComposVisitor.class grammar/AbstractVisitor.class grammar/FoldVisitor.class grammar/AllVisitor.class grammar/parser.class grammar/sym.class grammar/Test.class

.PHONY: absyn

%.class: %.java
	${JAVAC} ${JAVAC_FLAGS} $^

absyn: grammar/Absyn/Stmt.java grammar/Absyn/Assign.java grammar/Absyn/If.java grammar/Absyn/IfElse.java grammar/Absyn/Exp.java grammar/Absyn/DExp.java
	${JAVAC} ${JAVAC_FLAGS} $^

grammar/Yylex.java: grammar/Yylex
	${LEXER} ${LEXER_FLAGS} grammar/Yylex

grammar/parser.java grammar/sym.java: grammar/_cup.cup
	${PARSER} ${PARSER_FLAGS} grammar/_cup.cup
	mv parser.java sym.java grammar/

grammar/Yylex.class: grammar/Yylex.java grammar/parser.java grammar/sym.java

grammar/sym.class: grammar/sym.java

grammar/parser.class: grammar/parser.java grammar/sym.java

grammar/PrettyPrinter.class: grammar/PrettyPrinter.java

clean:
	rm -f grammar/Absyn/*.class grammar/*.class

distclean: vclean

vclean:
	 rm -f grammar/Absyn/Stmt.java grammar/Absyn/Assign.java grammar/Absyn/If.java grammar/Absyn/IfElse.java grammar/Absyn/Exp.java grammar/Absyn/DExp.java grammar/Absyn/Stmt.class grammar/Absyn/Assign.class grammar/Absyn/If.class grammar/Absyn/IfElse.class grammar/Absyn/Exp.class grammar/Absyn/DExp.class
	 rm -f grammar/Absyn/*.class
	 rmdir grammar/Absyn/
	 rm -f grammar/Yylex grammar/_cup.cup grammar/Yylex.java grammar/VisitSkel.java grammar/ComposVisitor.java grammar/AbstractVisitor.java grammar/FoldVisitor.java grammar/AllVisitor.java grammar/PrettyPrinter.java grammar/Skeleton.java grammar/Test.java grammar/parser.java grammar/sym.java grammar/*.class
	 rm -f Makefile
	 rmdir -p grammar/
