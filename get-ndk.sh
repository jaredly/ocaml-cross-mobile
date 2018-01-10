#!/bin/bash

if [[ `uname` == "Darwin" ]]; then
  wget --output-document=android-ndk.zip https://dl.google.com/android/repository/android-ndk-r11c-darwin-x86_64.zip
  unzip android-ndk.zip
  rm android-ndk.zip
  mv android-ndk-r11c android-ndk
else
  wget --output-document=android-ndk.zip https://dl.google.com/android/repository/android-ndk-r12b-linux-x86_64.zip
  unzip android-ndk.zip
  rm android-ndk.zip
  mv android-ndk-r12b android-ndk
fi
