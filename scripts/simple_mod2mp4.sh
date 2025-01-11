#!/bin/bash

# Using:
# ./mod2mp4-simple <FILE.MOD> <OUTPUT_DIR_FOR_MP4>

IN=$1
DIR=$2
OUT=$DIR/`basename ${IN//MOD/mp4}`

mkdir -p `pwd`/$2

echo in: $IN
echo out: $OUT

ffmpeg -i $IN -c:v libx264 -preset slow -crf 22 -c:a aac $OUT 
