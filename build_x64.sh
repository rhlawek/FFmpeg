#!/bin/sh

# build_x64.sh

./prep_x64.sh

export PATH="/C/Program Files (x86)/Microsoft Visual Studio/2017/Professional/VC/Tools/MSVC/14.13.26128/bin/Hostx64/x64/":$PATH
export PKG_CONFIG_PATH=/c/OSS/nv-codec-headers:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=/c/builds/x264/x64/lib/pkgconfig:$PKG_CONFIG_PATH

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
--enable-libnpp \
--prefix=/c/builds/ffmpeg/x64 \
--extra-cflags=-I/usr/local/include \
--extra-ldflags=-LIBPATH:/usr/local/lib64 \
--toolchain=msvc

make
make install

#--enable-filter=*fade,*format,*resample,aeval,all*,atempo,color*,convolution,draw*,eq*,framerate,hw*,null,volume,scale* \
#--enable-decoder=*sub*,*text*,*web*,aac*,ac3*,alac*,ape,ass,cc_dec,cook,eac3*,flv,flac,h264*,hevc*,mp[1-3]*,nvenc*,*peg*,mpl2,nellymoser,opus,pcm*,rawvideo,rv*,sami,srt,ssa,v210*,vc1*,vorbis,vp[6-9],wm*,wrapped_avframe \
#--enable-demuxer=*sub*,*text*,*ac3,*ac,*peg*,*web*,ape,ass,avi,concat,*dash*,*flv,hls,h264,hevc,matroska,mlv,mov,mp3,mxf,nsv,nut,ogg,pcm*,rawvideo,rt*p,srt,vc1,v210*,wav,*pipe \
#--enable-parser=*sub*,aac*,ac3,cook,flac,h26[3-4],hevc,*peg*,opus,rv*,vc1,vorbis,vp[8-9] \
#--enable-encoder=aac,gif,h26[3-4]*,hevc*,mjpeg,mpeg[2-4]*,nellymoser,nvenc*,opus,pcm*,rawvideo,vorbis,vp*,wrapped_avframe \
#--enable-muxer=dash,fifo,gif,h264,hevc,hls,mjpeg,matroska*,mov,mp4,mpegts,nu*,og*,pcm*,rawvideo,wav,webm,*pipe \
#--disable-shared \
#--disable-filters \
#--disable-muxers \
#--disable-encoders \
#--disable-decoders \
#--disable-demuxers \
#--disable-parsers \
