# 🎙️ ATC Recorder 🛩️

The **ATC Recorder** is a tool crafted to aid student pilots in enhancing their listening comprehension skills. 🎧 It captures live aviation ATC communications and processes the recordings to remove silent periods, ensuring a seamless and efficient review of communications without the drag of unnecessary pauses.

## Table of Contents

- [Motivation](#-motivation)
- [Features](#-features)
- [Tech Stack](#-tech-stack)
- [Usage](#-usage)
  - [Prerequisites](#-prerequisites)
  - [Setup](#setup)
  - [Running](#running)
- [Configurations](#-configurations)

## 🌟 Motivation

For any aspiring pilot, deciphering live ATC communications can be a daunting task due to the swift pace and unique terminologies. By immersing oneself in these communications, comprehension can be enhanced over time. However, the extended silences can hamper this learning process. This tool comes to the rescue, offering crisp audio recordings free from silent stretches. 🚀

## 🎉 Features

- **Live Recording**: Grabs real-time ATC communication streams.
- **Silence Removal**: Processes recordings, ensuring you only hear what's important.
- **Dockerized Application**: Ensuring a hassle-free experience across all environments.
- **Customizable Parameters**: Tailor your recording experience as per your needs.

## ⚙️ Tech Stack

- **Docker**: For streamlined containerization and deployment. 🐳
- **FFmpeg**: For all things audio – recording, processing, and segmentation. 🎵
- **Bash**: The backbone script that drives the recording and processing. 🖥️

## 🚀 Usage

### 📋 Prerequisites

Make sure Docker is up and humming on your machine. 🖥️

### Setup

1. **Clone the repository**:
   ```
    git clone https://github.com/lps83/atc-recorder.git
    cd atc-recorder
   ```

2. **Build the Docker image:**
    ```
      docker build -t atc_recorder.
    ```

## 🐳 Dockerhub Image

If you prefer not to build the image yourself, you can pull the pre-built Docker image directly from Dockerhub:

    ```
      docker pull lps83/atc-recorder:linux
    ```

### Running

3. **Get the Recorder airborne:**:
    ```
    docker run -v /path/on/your/host:/workspace/output \
    -e STREAM_URL=http://your-streaming-url-here \
    -e STREAM_DURATION=7200 \
    atc_recorder
    ```
    
### 🛠️ Configurations

**STREAM_URL:** Specify the live ATC communication stream's URL.<br />
**STREAM_DURATION:** Set your preferred recording duration (in seconds).<br />
**DEBUG_MODE:** Dive deep with logs and temporary files.<br />
**SILENCE_THRESHOLD:** Tweak the silence detection dB threshold.<br />
**SILENCE_DURATION:** Define what duration should qualify as silence.<br />