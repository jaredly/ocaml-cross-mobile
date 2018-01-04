set -e

BASE=./armv7
SYSROOT=$BASE/android-sysroot
DARWIN_NDK=./android-ndk/toolchains/aarch64-linux-android-4.9/prebuilt/darwin-x86_64
NDK=./android-ndk
BASIC="$DARWIN_NDK/bin/aarch64-linux-android-gcc  --sysroot $NDK/platforms/android-24/arch-arm64 -I$NDK/include -L$NDK/lib -I$NDK/sources/cxx-stl/gnu-libstdc++/4.9/include -I$NDK/sources/cxx-stl/gnu-libstdc++/4.9/libs/arm64-v8a/include -L$NDK/sources/cxx-stl/gnu-libstdc++/4.9/libs/arm64-v8a -I$SYSROOT/include -L$SYSROOT/lib -O2"
OCAMLLIB=$SYSROOT/lib/ocaml \
CAML_BYTERUN=$SYSROOT/bin/ocamlrun \
CAML_BYTECC="$BASIC -fno-defer-pop -Wall-D_FILE_OFFSET_BITS=64 -D_REENTRANT -fPIC" \
CAML_NATIVECC="$BASIC -Wall -D_FILE_OFFSET_BITS=64 -D_REENTRANT" \
CAML_PACKLD="$DARWIN_NDK/bin/aarch64-linux-android-ld --sysroot $NDK/platforms/android-24/arch-arm64 -L$NDK/lib -L$NDK/sources/cxx-stl/gnu-libstdc++/4.9/libs/arm64-v8a -L$SYSROOT/lib -r  -o" \
CAML_RANLIB=$DARWIN_NDK/bin/aarch64-linux-android-ranlib \
CAML_ASM=$DARWIN_NDK/bin/aarch64-linux-android-as \
CAML_MKDLL="$BASIC -shared" \
CAML_MKEXE="$BASIC" \
CAML_MKMAINDLL="$BASIC -shared" \
$SYSROOT/bin/ocamlrun $SYSROOT/bin/ocamlc "$@"

echo
echo
echo "vs"
echo
echo

$SYSROOT/bin/ocamlrun $SYSROOT/bin/ocamlc "$@"