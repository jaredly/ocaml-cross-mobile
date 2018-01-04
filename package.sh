

cp android-full-x86/bin/ocamldep.byte android-x86/bin/ocamldep


mkdir -p ios-arm64/bin ios-arm64/lib
cp ios-full-arm64/bin/ocamlopt.byte ios-arm64/bin/ocamlopt
cp ios-full-arm64/bin/ocamldep.byte ios-arm64/bin/ocamldep
cp ios-full-arm64/bin/ocamlrun ios-arm64/bin/ocamlrun
cp -r ios-full-arm64/lib/ocaml ios-arm64/lib