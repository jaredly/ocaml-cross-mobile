set -e

SYSROOT=./ios-arm64
BASIC="clang -arch arm64 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk -miphoneos-version-min=8.0"
OCAMLLIB=$SYSROOT/lib/ocaml \
CAML_BYTERUN=$SYSROOT/bin/ocamlrun \
CAML_BYTECC="$BASIC -O2 -Wall " \
CAML_NATIVECC="$BASIC -O2 -Wall " \
CAML_ASM="$BASIC -c" \
CAML_MKEXE="$BASIC -O2" \
$SYSROOT/bin/ocamlrun $SYSROOT/bin/ocamlc "$@"

echo
echo
echo "vs"
echo
echo

$SYSROOT/bin/ocamlrun $SYSROOT/bin/ocamlc "$@"