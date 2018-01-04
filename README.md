# ocaml-cross-mobile

## make the shared directory
```
mkdir ~/.ocaml-cross-mobile
```

## get the helper binaries
Get `refmt` and `matchenv.ppx` from the releases page & stick them in `~/.ocaml-cross-mobile` https://github.com/jaredly/ocaml-cross-mobile/releases

## get your cross-compilers
Download the android or ios cross-compilers (or both) from the [releases page](https://github.com/jaredly/ocaml-cross-mobile/releases). Unzip them into `~/.ocaml-cross-mobile`.

If developing for android, download ndk 11c from https://developer.android.com/ndk/downloads/older_releases.html, and put it in `~/.ocaml-cross-mobile/android-ndk`.
