
# based on https://github.com/bsansouci/reasongl-ios/blob/master/config/Makefile
# and https://github.com/yunxing/opam-cross-ios/blob/master/packages/ocaml-ios64.4.02.3/files/config/Makefile.in

curl -O -L https://github.com/whitequark/ocaml/archive/1ae2f3f2ee572d159d2bd36f361a805eddcc68ec.zip
unzip 1ae2f3f2ee572d159d2bd36f361a805eddcc68ec.zip

export TOOLCHAIN_BIN=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin

export PLATFORM=iPhoneSimulator
export ARCH=amd64
export SUBARCH=x86_64

# export PLATFORM=iPhoneOS
# export ARCH=arm64
# export SUBARCH=arm64

rm -rf ocaml-ios-$SUBARCH
mv ocaml-1ae2f3f2ee572d159d2bd36f361a805eddcc68ec/ ocaml-ios-$SUBARCH
cp ios-config/* ocaml-ios-$SUBARCH/config
cd ocaml-ios-$SUBARCH


export PREFIX=`pwd`
export MIN_IOS_VERSION=9.3
export CC_FLAGS="-arch $SUBARCH -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/$PLATFORM.platform/Developer/SDKs/$PLATFORM.sdk -miphoneos-version-min=$MIN_IOS_VERSION"
export LINK_OPTS=-Wl,-syslibroot,/Applications/Xcode.app/Contents/Developer/Platforms/$PLATFORM.platform/Developer/SDKs/$PLATFORM.sdk

export HOST_BIN=`pwd`/../../wq-host/release/bin

make world opt install

rm -rf ../../ios-$SUBARCH
cp -r ios-sysroot ../../ios-$SUBARCH
