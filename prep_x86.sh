#!/bin/sh

#prep_x86.sh

cd /c/OSS/nv-codec-headers
make && make install

cd /c/OSS/x264
make clean
CC=cl ./configure --enable-static --prefix=/c/builds/x264/x86 --disable-cli
make && make install

cd /c/OSS/ffmpeg_rah

mkdir /usr/local/include
mkdir /usr/local/lib

cp -R /c/Program\ Files/NVIDIA\ GPU\ Computing\ Toolkit/CUDA/v9.1/include/* /usr/local/include/
cp -R /c/Program\ Files/NVIDIA\ GPU\ Computing\ Toolkit/CUDA/v9.1/lib/win32/* /usr/local/lib/

cp -R /c/builds/x264/x86/lib/* /usr/local/lib/
cp -R /c/builds/x264/x86/include/* /usr/local/include/

