#!/bin/sh

#build_x64.sh

./prep_x86.sh

export PATH="/C/Program Files (x86)/Microsoft Visual Studio/2017/Professional/VC/Tools/MSVC/14.13.26128/bin/Hostx86/x86/":$PATH
export PKG_CONFIG_PATH=/c/OSS/nv-codec-headers:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=/c/builds/x264/x86/lib/pkgconfig:$PKG_CONFIG_PATH

make clean

./configure \
--enable-static \
--disable-shared \
--disable-avdevice \
--disable-avresample \
--enable-gpl \
--enable-libx264 \
--enable-cuda \
--enable-cuvid \
--enable-nvenc \
--enable-nonfree \
--prefix=/c/builds/ffmpeg/x86 \
--extra-cflags=-I/usr/local/include \
--extra-ldflags=-LIBPATH:/usr/local/lib \
--toolchain=msvc

make
make install

#--disable-shared \
#--disable-filters \
#--disable-muxers \
#--disable-encoders \
#--disable-decoders \
#--disable-demuxers \
#--disable-parsers \
