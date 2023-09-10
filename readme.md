ATC Recorder

The ATC Recorder is a tool designed to aid student pilots in enhancing their listening comprehension skills. It captures live aviation ATC communications and processes the recordings to remove silent periods, ensuring efficient review of communications without the unnecessary pauses.

Motivation

As an aspiring pilot, deciphering live ATC communications can pose a challenge due to the rapid pace and unique terminologies in play. Listening to these communications repeatedly can enhance comprehension over time. However, the extended periods of silence in between can make the exercise tedious. This tool is designed to optimize this training phase by offering condensed audio recordings free from the silent intervals.

Features

Live Recording: Captures real-time ATC communication streams.
Silence Removal: Automatically processes recordings to weed out silent periods.
Dockerized Application: Guarantees consistent setup and execution across diverse environments.
Customizable Parameters: Modify recording durations, silence thresholds, and debug options to your preference.
Tech Stack

Docker: For streamlined containerization and deployment.
FFmpeg: Utilized for recording, processing, and segmenting audio streams.
Bash: Powers the core script that coordinates the recording and processing phases.
Usage

Prerequisites
Ensure Docker is up and running on your machine.
Setup & Running

Clone the repository:

git clone 

docker build -t atc_recorder .
Deploy the Recorder:

docker run -v /path/on/your/host:/workspace/output \
-e STREAM_URL=http://your-streaming-url-here \
atc_recorder

Update the values of STREAM_URL as required.

Configurations
STREAM_URL: Specify the URL of the live ATC communication stream.
STREAM_DURATION: Set the duration (in seconds) for each block of recording. Default is set to 7200 seconds (equivalent to 2 hours).
DEBUG_MODE: Set to true to enable in-depth logs and maintain temporary files. Default is set to false.
SILENCE_THRESHOLD: Modify the dB threshold to detect silence. Default threshold is -50dB.
SILENCE_DURATION: Define the duration (in seconds) which should be classified as silence. Default is 10 seconds.

Acknowledgements

OpenAI's ChatGPT: Their invaluable guidance played a pivotal role in the development of this application. :) 
The entire aviation community: For their unyielding dedication towards safety and effective training.