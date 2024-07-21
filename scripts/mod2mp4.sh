#!/bin/bash

# Using:
# ./mod2mp4 <FILE.MOD> <OUTPUT_DIR_FOR_MP4>

IN=$1
DIR=$2
OUT=$DIR/`basename ${IN//MOD/mp4}`

mkdir -p `pwd`/$2

echo in: $IN
echo out: $OUT

ffmpeg -y -i $IN -c:v libx264 -b:v 6500k -pass 1 -an -f null -preset slower -crf 22 -tune grain /dev/null && \
ffmpeg -i $IN -c:v libx264 -b:v 6500k -pass 2 -c:a aac -preset slower -crf 20 -tune grain $OUT

rm -rf ./*.mbtree ./*.log

