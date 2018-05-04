#!/bin/sh

#prep_x64.sh

cd /c/OSS/nv-codec-headers
make
make install

cd /c/OSS/x264
CC=cl ./configure --enable-static --prefix=/c/builds/x264/x64 --disable-cli
make
make install

cd /c/OSS/ffmpeg

mkdir /usr/local/include
mkdir /usr/local/lib64

cp -R /c/Program\ Files/NVIDIA\ GPU\ Computing\ Toolkit/CUDA/v9.1/include/* /usr/local/include/
cp -R /c/builds/x264/x64/include/* /usr/local/include/

cp -R /c/Program\ Files/NVIDIA\ GPU\ Computing\ Toolkit/CUDA/v9.1/lib/x64/* /usr/local/lib64/
cp -R /c/builds/x264/x64/lib/* /usr/local/lib64/

