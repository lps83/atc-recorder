FROM alpine:latest

# Set environment variables
ENV STREAM_URL=http://
ENV STREAM_DURATION=28800

# Install necessary packages
RUN apk update && apk add --no-cache \
    ffmpeg \
    gawk \
    bash

WORKDIR /workspace

# Copy the script to the workspace
COPY process_audio.sh /workspace/

# Make the script executable
RUN chmod +x /workspace/process_audio.sh

ENTRYPOINT ["/workspace/process_audio.sh"]
