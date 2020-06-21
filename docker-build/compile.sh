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