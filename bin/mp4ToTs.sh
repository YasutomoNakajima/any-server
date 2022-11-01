#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage) bash ${0} \${file_path_for_mp4}"
    exit 1
fi

inputFile=$1
echo "inputFile is ${inputFile}"
if [ "${inputFile##*.}" != 'mp4' ]; then
    echo "file extension was must be '.mp4'"
    exit 1
fi

base=`basename $inputFile .mp4` 
mkdir -p -v ./$base

ffmpeg -i $inputFile -c:v copy -c:a copy -f hls -hls_time 12 -hls_playlist_type vod -hls_segment_filename "./$base/%12d.ts" ./$base/index.m3u8