export FRAMERATE=30
export KEYFRAME=120
export BITRATE=2250000
while true; do
raspivid --nopreview --timeout 0 --width 1280 --height 720 \
        --awb greyworld --drc high \
        --profile high --level 4.1 --digitalgain 2.0\
        --framerate $FRAMERATE --intra $KEYFRAME --bitrate 3000000\
        --annotate 4 --annotate "%Y-%m-%d %X" \
	-l -o tcp://0.0.0.0:3333
done
