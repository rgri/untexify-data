#!/nix/store/xdqlrixlspkks50m9b0mpvag65m3pf2w-bash-5.2-p15/bin/bash
while read line
do
    tex2svg $line ./out/$line.svg
    inkscape -D -w 256 -h 256 ./out/$line.svg -o ./out/$line.png

done < equations.txt
