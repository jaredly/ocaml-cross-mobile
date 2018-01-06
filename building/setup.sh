
if [ ! -d ./ios-full-arm64 ]; then
  echo "Installing ios arm64";
  opam switch 4.04.0
  eval `opam config env`

  opam remove -y conf-ios
  ARCH=arm64 SUBARCH=arm64 PLATFORM=iPhoneOS SDK=10.3 VER=8.0 \
    opam install -y conf-ios

  opam unpin -y ocaml-ios64
  opam source ocaml-ios64 --pin
  (cd ocaml-ios64.4.04.0 && patch -p1 < ../config_cross.patch)
  time opam install -y ocaml-ios64

  mv ~/.opam/4.04.0/ios-sysroot ios-full-arm64
  mv ocaml-ios64.4.04.0 pins/oi-arm64
fi

if [ ! -d ./ios-full-x86_64 ]; then
  echo "Installing ios x86_64";
  opam switch 4.04.0
  eval `opam config env`

  opam remove -y conf-ios
  ARCH=amd64 SUBARCH=x86_64 PLATFORM=iPhoneSimulator SDK=10.3 VER=8.0 \
    opam install -y conf-ios

  opam unpin -y ocaml-ios64
  opam source ocaml-ios64 --pin
  (cd ocaml-ios64.4.04.0 && patch -p1 < ../config_cross.patch)
  time opam install -y ocaml-ios

  mv ~/.opam/4.04.0/ios-sysroot ios-full-x86_64
  mv ocaml-ios64.4.04.0 pins/oi-x86_64
fi


if [ ! -d ./android-full-armv7 ]; then
  opam repository remove android
  opam repository add android git://github.com/whitequark/opam-cross-android

  opam switch 4.04.0+32bit
  eval `opam config env`

  opam remove -y conf-android
  ARCH=arm SUBARCH=armv7 SYSTEM=linux_eabi \
    CCARCH=arm TOOLCHAIN=arm-linux-androideabi-4.9 \
    TRIPLE=arm-linux-androideabi LEVEL=24 \
    STLVER=4.9 STLARCH=armeabi \
    opam install -y conf-android

  opam unpin -y ocaml-android32
  opam source ocaml-android32 --pin
  (cd ocaml-android32.4.04.0 && patch -p1 < ../config_cross.patch)
  time opam install -y ocaml-android32

  mv ~/.opam/4.04.0+32bit/android-sysroot android-full-armv7

  mv ocaml-android32.4.04.0 pins/oa-armv7
fi;

if [ ! -d ./android-full-x86 ]; then
  opam repository remove android
  opam repository add android git://github.com/whitequark/opam-cross-android

  opam switch 4.04.0+32bit
  eval `opam config env`

  opam remove -y conf-android
  ARCH=i386 SUBARCH=default SYSTEM=linux_elf \
    CCARCH=x86 TOOLCHAIN=x86-4.9 \
    TRIPLE=i686-linux-android LEVEL=24 \
    STLVER=4.9 STLARCH=x86 \
    opam install -y conf-android

  opam unpin ocaml-android32
  opam source ocaml-android32 --pin
  (cd ocaml-android32.4.04.0 && patch -p1 < ../config_cross.patch)
  time opam install -y ocaml-android32

  mv ~/.opam/4.04.0+32bit/android-sysroot android-full-x86

  mv ocaml-android32.4.04.0 pins/oa-x86
fi;

# took 3 minutes 30 seconds on my machine