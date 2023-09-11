FROM ubuntu:20.04

# Avoiding user interaction with tzdata
ENV DEBIAN_FRONTEND=noninteractive
ENV STREAM_URL=http://
ENV STREAM_DURATION=28800

RUN apt update && apt upgrade && apt-get install -y \
    ffmpeg \
    gawk \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

COPY process_audio.sh /workspace/

RUN chmod +x /workspace/process_audio.sh

ENTRYPOINT ["/workspace/process_audio.sh"]
