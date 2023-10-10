#!/bin/bash
while read line
do
    tex2svg $line ./original_images/$line.svg
    inkscape -D -w 256 -h 256 ./original_images/$line.svg -o ./original_images/$line.png
    rm ./original_images/$line.svg


done < equations.txt
