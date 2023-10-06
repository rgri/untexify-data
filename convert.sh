#!/run/current-system/sw/bin/bash
while read line
do
    tex2svg $line ./out/$line.svg
    inkscape -D -w 256 -h 256 ./out/$line.svg -o ./out/$line.png
    rm ./out/$line.svg


done < equations.txt
