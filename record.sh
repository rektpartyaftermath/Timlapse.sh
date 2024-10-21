#!/bin/bash
clearPng(){
	rm ./*png
	rm ./lastframe
}

if [ "$1" == "restart" ]
then
	clearPng
fi

frame=$(cat ./lastframe)
# delay before recording start
startdelay=5
# delay between each scrot
delay=2

echo "recording will start in $startdelay seconds"
sleep $startdelay
echo "pressing any key will stop the recording"
while (true)
do
	filename=$(printf '%04d.png' "$frame")
	read -t $delay -n 1 a && echo " " && exit
	scrot $filename
	((frame++))
	echo "$frame" > lastframe
	echo -ne "\r$filename"
done
