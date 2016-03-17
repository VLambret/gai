#!/bin/bash

for SVG in $(ls out/*.svg);
do
    PNG=${SVG/%svg/png}
    inkscape -z -e $PNG $SVG
done

ffmpeg -i out/output_%08d.png -r 25 out/video.mp4
