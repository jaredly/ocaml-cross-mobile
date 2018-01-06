
if [[ `uname` == "Darwin" ]]; then
  function get_and_extract {
    curl -O -L https://github.com/jaredly/ocaml-cross-mobile/releases/download/2.0.0/$1
    unzip $1
    rm $1
  }

  get_and_extract android-armv7-macos-4.02.3.zip
  get_and_extract android-x86-macos-4.02.3.zip
  get_and_extract ios-arm64-macos-4.02.3.zip
  get_and_extract ios-x86_64-macos-4.02.3.zip
else
  function get_and_extract {
    wget https://github.com/jaredly/ocaml-cross-mobile/releases/download/2.0.0/$1
    unzip $1
    rm $1
  }

  get_and_extract android-armv7-linux-4.02.3.zip
  get_and_extract android-x86-linux-4.02.3.zip
fi
