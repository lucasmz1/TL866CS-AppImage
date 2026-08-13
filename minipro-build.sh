#!/bin/env bash
sudo apt-get update
sudo apt-get install libusb-1.0-0-dev pkg-config file binutils patchelf findutils grep sed coreutils strace libudev-dev xvfb wget git build-essential zlib1g-dev -y
mkdir AppDir
wget -q -c "https://github.com/VHSgunzo/sharun/releases/download/v0.8.1/sharun-x86_64" -O ${GITHUB_WORKSPACE}/AppDir/sharun; chmod +x ${GITHUB_WORKSPACE}/AppDir/sharun
wget -q -c "https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage" -O appimagetool; chmod +x appimagetool
git clone https://gitlab.com/DavidGriffith/minipro.git
cd minipro/
make
sudo make install
cd "${GITHUB_WORKSPACE}"
cp "${GITHUB_WORKSPACE}"/icon.png "${GITHUB_WORKSPACE}"/AppDir/
cp "${GITHUB_WORKSPACE}"/minipro.desktop "${GITHUB_WORKSPACE}"/AppDir/
cd "${GITHUB_WORKSPACE}"/AppDir/
xvfb-run -d -- ./sharun l -p -v -e -s -k /usr/bin/minipro
ln sharun AppRun
./AppRun -g
cd ..
REPO="TL866CS-AppImage"
TAG="continuous-universal"
UPINFO="gh-releases-zsync|$GITHUB_REPOSITORY_OWNER|$REPO|$TAG|*x86_64.AppImage.zsync"
ARCH=x86_64 ./appimagetool -u "$UPINFO" ./AppDir/
