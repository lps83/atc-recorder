#!/bin/bash

echo "ATC Recorder V0.2"

URL=$STREAM_URL
DURATION=$STREAM_DURATION
SILENCE_THRESHOLD=${SILENCE_THRESHOLD:-"-30dB"}
SILENCE_DURATION=${SILENCE_DURATION:-"10"}

DEBUG=${DEBUG_MODE:-false}
if [ "$DEBUG" == "true" ]; then
    LOG_LEVEL="debug"
else
    LOG_LEVEL="error" # or "warning" if you prefer
fi

# Extract the last part of the URL after the slash
BASE_FOLDER_NAME=$(basename $URL)
CURRENT_DATETIME=$(date +"%Y-%m-%d_%H-%M-%S")
FOLDER_NAME="${BASE_FOLDER_NAME}_${CURRENT_DATETIME}"

# Create a directory with that name if it doesn't exist
mkdir -p output/$FOLDER_NAME
cd output/$FOLDER_NAME

while true; do

    # Generate timestamp for unique naming
    TIMESTAMP=$(date +"%Y%m%d%H%M%S")

    ffmpeg -i ${URL} -acodec libmp3lame -ar 44100 -ac 2 -t ${DURATION} "recording_${TIMESTAMP}.mp3"

    # Detect silence and save timestamps to a file
    ffmpeg -loglevel $LOG_LEVEL -i "recording_${TIMESTAMP}.mp3" -af "silencedetect=n=${SILENCE_THRESHOLD}:d=${SILENCE_DURATION}" -f null - 2>"silence_${TIMESTAMP}.txt"

    # Split the recording based on silence timestamps
    awk '/silence_start/ {print $5} /silence_end/ {print $5}' "silence_${TIMESTAMP}.txt" >"times_${TIMESTAMP}.txt"

    PREV_END=0
    SEGMENT_NUM=1

    while
        read -r START
        read -r END
    do
        # Convert to seconds
        START_SEC=$(echo "$START" | awk -F: '{print $2}' | awk '{printf "%.0f\n", $1 - 1}')
        END_SEC=$(echo "$END" | awk -F: '{print $2}' | awk '{printf "%.0f\n", $1 + 1}')

        # Extract segment using FFmpeg
        ffmpeg -loglevel $LOG_LEVEL -i "recording_${TIMESTAMP}.mp3" -ss "$PREV_END" -to "$START_SEC" "segment_${SEGMENT_NUM}_${TIMESTAMP}.mp3"

        SEGMENT_NUM=$((SEGMENT_NUM + 1))
        PREV_END=$END_SEC
    done <"times_${TIMESTAMP}.txt"

    # Process the tail end of the recording if needed
    ffmpeg -loglevel $LOG_LEVEL -i "recording_${TIMESTAMP}.mp3" -ss "$PREV_END" "segment_${SEGMENT_NUM}_${TIMESTAMP}.mp3"

    # Optional cleanup, based on DEBUG_MODE
    if [ "$DEBUG" != "true" ]; then
        rm "recording_${TIMESTAMP}.mp3" "silence_${TIMESTAMP}.txt" "times_${TIMESTAMP}.txt"
    fi

done
