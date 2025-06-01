#!/bin/bash

if [ ! $# -eq 3 ]
then
    echo "3 arguments required:"
    echo "Using: "
    echo "./mod2mp4 -f <FILE.MOD> <OUTPUT_DIR_FOR_MP4>"
    echo "./mod2mp4 -d <DIR> <OUTPUT_DIR_FOR_MP4_FILES>"
    exit 1
fi

if [ ! -f $2 ]
then
    mkdir -p $3
fi

if [[ "$1" == "-f" ]]
then

    tmp=$(basename $2)
    resultfile=$3/${tmp//"MOD"/"mp4"}
    convert_mod_to_mp4 "$2" "$resultfile"
fi

if [[ "$1" == "-d" ]]
then

    for f in "$2"/*.MOD
    do 
        tmp=$(basename $f)
        resultfile=$3/${tmp//"MOD"/"mp4"}
        convert_mod_to_mp4 "$f" "$resultfile"
    done
fi

function convert_mod_to_mp4 {
    local input="$1"
    local output="$2"
    echo "Input file: $input"
    echo "Output file: $output"

    ffmpeg -i $input -c:v libx264 -preset slow -crf 22 -c:a aac $output
}
