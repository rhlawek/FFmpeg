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
--disable-filters \
--disable-muxers \
--disable-encoders \
--disable-decoders \
--disable-demuxers \
--disable-parsers \
--enable-gpl \
--enable-libx264 \
--enable-cuda \
--enable-cuvid \
--enable-nvenc \
--enable-nonfree \
--enable-filter=*auto*,*fade,*format,*resample,aeval,all*,atempo,color*,convolution,draw*,eq*,framerate,hw*,null,volume,scale* \
--enable-demuxer=*sub*,*text*,*ac3,*ac,*peg*,*web*,ape,ass,avi,concat,*dash*,*flv,hls,h264,hevc,matroska,mlv,mov,mp3,mxf,nsv,nut,ogg,pcm*,rawvideo,rt*p,srt,vc1,v210*,wav,*pipe \
--enable-decoder=*sub*,*text*,*web*,aac*,ac3*,alac*,ape,ass,cc_dec,cook,eac3*,flv,flac,h264*,hevc*,mp[1-3]*,nvdec*,*peg*,mpl2,nellymoser,opus,pcm*,rawvideo,rv*,sami,srt,ssa,v210*,vc1*,vorbis,vp[6-9],wm*,wrapped_avframe \
--enable-parser=*sub*,aac*,ac3,cook,flac,h26[3-4],hevc,*peg*,opus,rv*,vc1,vorbis,vp[8-9] \
--enable-encoder=aac,gif,h26[3-4]*,hevc*,libx264,mjpeg,mpeg[2-4]*,nellymoser,nvenc*,opus,pcm*,rawvideo,vorbis,vp*,wrapped_avframe,linx* \
--enable-muxer=dash,fifo,gif,h264,hevc,hls,mjpeg,matroska*,mov,mp4,mpegts,nu*,og*,pcm*,rawvideo,wav,webm,*pipe \
--prefix=/c/builds/ffmpeg_rah/x86 \
--extra-cflags=-I/usr/local/include \
--extra-ldflags=-LIBPATH:/usr/local/lib \
--extra-ldexeflags=-SUBSYSTEM:CONSOLE,5.01 \
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
