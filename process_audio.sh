#!/bin/bash

echo "ATC Recorder V1"

URL=$STREAM_URL
DURATION=$STREAM_DURATION
SILENCE_THRESHOLD=${SILENCE_THRESHOLD:-"-30dB"}
SILENCE_DURATION=${SILENCE_DURATION:-"3"}

FOLDER_NAME=$(basename $URL)
CURRENT_DATETIME=$(date +"%Y-%m-%d_%H-%M-%S")

mkdir -p output/$FOLDER_NAME
cd output/$FOLDER_NAME

while true; do

    TIMESTAMP=$(date +"%Y%m%d%H%M%S")
    ffmpeg -loglevel error -hide_banner -nostats -i ${URL} -acodec libmp3lame -ar 44100 -ac 2 -t ${DURATION} "temp_recording_${TIMESTAMP}.mp3"
    ffmpeg -loglevel error -hide_banner -nostats -i "temp_recording_${TIMESTAMP}.mp3" -af "silenceremove=start_periods=1:stop_periods=-1:start_threshold=${SILENCE_THRESHOLD}:stop_threshold=${SILENCE_THRESHOLD}:start_silence=${SILENCE_DURATION}:stop_silence=${SILENCE_DURATION}" "recording_${TIMESTAMP}.mp3"
    rm "temp_recording_${TIMESTAMP}.mp3"

done
