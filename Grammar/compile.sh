tr TestGrammar
cd target
tr *
bnfc -m ../grammar.cf
make
cp TestGrammar ..
cd ..
