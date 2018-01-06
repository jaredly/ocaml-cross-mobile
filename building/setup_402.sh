
set -ex

if [[ `uname` == "Darwin" ]]; then
  opam repository remove ios || echo "no ios repo"
  opam repository add ios git://github.com/yunxing/opam-cross-ios
fi

if [[ ! -d ./ios-full-arm64 && `uname` == "Darwin" ]]; then
  echo "Building ios arm64";
  opam switch 4.02.3
  eval `opam config env`

  opam remove -y conf-ios
  ARCH=arm64 SUBARCH=arm64 PLATFORM=iPhoneOS SDK=10.3 VER=8.0 \
    opam install -y conf-ios

  opam unpin -y ocaml-ios64
  opam source ocaml-ios64 --pin
  (cd ocaml-ios64.4.02.3 && patch -p1 < ../config_cross_402.patch)
  opam install -y ocaml-ios64

  mv ~/.opam/4.02.3/ios-sysroot ios-full-arm64
  mv ocaml-ios64.4.02.3 pins/oi-arm64
fi

if [[ ! -d ./ios-full-x86_64 && `uname` == "Darwin" ]]; then
  echo "Building ios x86_64";
  opam switch 4.02.3
  eval `opam config env`

  opam remove -y conf-ios
  ARCH=amd64 SUBARCH=x86_64 PLATFORM=iPhoneSimulator SDK=10.3 VER=8.0 \
    opam install -y conf-ios

  opam unpin -y ocaml-ios64
  opam source ocaml-ios64 --pin
  (cd ocaml-ios64.4.02.3 && patch -p1 < ../config_cross_402.patch)
  opam install -y ocaml-ios

  mv ~/.opam/4.02.3/ios-sysroot ios-full-x86_64
  mv ocaml-ios64.4.02.3 pins/oi-x86_64
fi


opam repository remove android || echo "no android repo"
opam repository add android git://github.com/yunxing/opam-cross-android

if [ ! -d ./android-full-armv7 ]; then
  echo "Building android armv7"

  opam switch 4.02.3+32bit
  eval `opam config env`

  opam remove -y conf-android

  ARCH=arm SUBARCH=armv7 SYSTEM=linux_eabi \
    CCARCH=arm TOOLCHAIN=arm-linux-androideabi-4.9 \
    TRIPLE=arm-linux-androideabi LEVEL=23 \
    STLVER=4.9 STLARCH=armeabi \
    opam install conf-android

  opam unpin -y ocaml-android32
  opam source ocaml-android32 --pin
  (cd ocaml-android32.4.02.3 && patch -p1 < ../config_cross_402.patch)

  opam install -y ocaml-android32

  mv ~/.opam/4.02.3+32bit/android-sysroot android-full-armv7

  mkdir -p pins
  mv ocaml-android32.4.02.3 pins/oa-armv7
fi;

if [ ! -d ./android-full-x86 ]; then
  echo "Building android x86"

  opam switch 4.02.3+32bit
  eval `opam config env`

  opam remove -y conf-android

  ARCH=i386 SUBARCH=default SYSTEM=linux_elf \
    CCARCH=x86 TOOLCHAIN=x86-4.9 \
    TRIPLE=i686-linux-android LEVEL=23 \
    STLVER=4.9 STLARCH=x86 \
    opam install conf-android


  opam unpin ocaml-android32
  opam source ocaml-android32 --pin
  (cd ocaml-android32.4.02.3 && patch -p1 < ../config_cross_402.patch)

  opam install -y ocaml-android32

  mv ~/.opam/4.02.3+32bit/android-sysroot android-full-x86

  mkdir -p pins
  mv ocaml-android32.4.02.3 pins/oa-x86
fi;

# took 3 minutes 30 seconds on my machine
