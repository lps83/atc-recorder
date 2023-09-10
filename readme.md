# 🎙️ ATC Recorder 🛩️

The **ATC Recorder** is a tool crafted to aid student pilots in enhancing their listening comprehension skills. 🎧 It captures live aviation ATC communications and processes the recordings to remove silent periods, ensuring a seamless and efficient review of communications without the drag of unnecessary pauses.

## Table of Contents

- [Motivation](#-motivation)
- [Features](#-features)
- [Tech Stack](#-tech-stack)
- [Usage](#-usage)
  - [Prerequisites](#-prerequisites)
  - [Setup & Running](#setup--running)
- [Configurations](#-configurations)
- [Acknowledgements](#-acknowledgements)

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

### Setup & Running

1. **Clone the repository**:
   ```bash
   git clone https://github.com/lps83/atc-recorder.git
   cd atc-recorder```

2. **Build the Docker image:**
    ```docker build -t atc_recorder .```

3. **Get the Recorder airborne:**:
    ```docker run -v /path/on/your/host:/workspace/output \
    -e STREAM_URL=http://your-streaming-url-here \
    -e STREAM_DURATION=7200 \
    atc_recorder
    ```
    
### 🛠️ Configurations

**STREAM_URL:** Specify the live ATC communication stream's URL.
**STREAM_DURATION:** Set your preferred recording duration (in seconds).
**DEBUG_MODE:** Dive deep with logs and temporary files.
**SILENCE_THRESHOLD:** Tweak the silence detection dB threshold.
**SILENCE_DURATION:** Define what duration should qualify as silence.

###  👏 Acknowledgements

Huge shoutout to:

**OpenAI's ChatGPT**: Their relentless support was pivotal in this venture. 🤖
The entire aviation community: Flying high because of their dedication. 🛫