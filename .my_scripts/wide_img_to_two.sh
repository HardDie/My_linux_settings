#!/bin/bash

IMG=$1

TMP_PATH=/tmp

echo ${IMG}

echo "Convert to png and resize to 3840x resolution..."
convert ${IMG} -resize 3840x ${TMP_PATH}/new_${IMG}.png

echo "Crop to two image..."
convert ${TMP_PATH}/new_${IMG}.png -crop 1920x1080 ${TMP_PATH}/crop_${IMG}.png

echo "Rename..."
mv ${TMP_PATH}/crop_${IMG}-0.png ${TMP_PATH}/wallpaper_l.png
mv ${TMP_PATH}/crop_${IMG}-1.png ${TMP_PATH}/wallpaper_r.png

echo "Finish!"
