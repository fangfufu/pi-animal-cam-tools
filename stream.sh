#!/bin/bash

# Set stream URL
#URL=rtmp://lhr04.contribute.live-video.net/app/
URL=rtmp://a.rtmp.youtube.com/live2

# Set stream key
#KEY=

# Use the old auto whitebalancing algorithm
# https://github.com/raspberrypi/firmware/issues/1167
sudo /usr/bin/vcdbg set awb_mode 0

# exposure_metering_mode=2 : Center Weighted
v4l2-ctl --set-ctrl exposure_metering_mode=1

# scene_mode=8 : Night
v4l2-ctl --set-ctrl scene_mode=8

while true; do
ffmpeg	-video_size 1280x720 -i /dev/video0 \
	-f alsa -channels 1 -sample_rate 44100 -i hw:1 \
	-vf "drawtext=text='%{localtime}': x=(w-tw)/2: y=lh: fontcolor=white: fontsize=24" \
	-af "volume=5.0" \
	-c:v h264_omx -b:v 2500k \
	-c:a libmp3lame -b:a 128k \
	-map 0:v -map 1:a -f flv "${URL}/${KEY}"
done
