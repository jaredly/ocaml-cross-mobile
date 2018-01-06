
# echo $1 $2
mkdir -p $1/bin $1/lib
cp $2/bin/ocamlopt $1/bin/ocamlopt
cp $2/bin/ocamldep $1/bin/ocamldep
cp $2/bin/ocamlrun $1/bin/ocamlrun
cp -r $2/lib/ocaml $1/lib
