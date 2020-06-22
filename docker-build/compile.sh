#!/usr/bin/env bash

# compile
cd ~/libsigrok4DSL
./autogen.sh
./configure
make -j$(nproc)
sudo make install

cd ~/libsigrokdecode4DSL
./autogen.sh
./configure
make -j$(nproc)
sudo make install

cd ~/DSView
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr .
make -j$(nproc)
make install DESTDIR=~/AppDir

# create appimage
sudo ldconfig

cd ~
wget -c -nv "https://github.com/probonopd/linuxdeployqt/releases/download/continuous/linuxdeployqt-continuous-x86_64.AppImage"
chmod a+x linuxdeployqt-continuous-x86_64.AppImage

./linuxdeployqt-continuous-x86_64.AppImage AppDir/usr/share/applications/*.desktop -appimage

rm -r /host/build
mkdir /host/build/
mv DSView*.AppImage /host/build/