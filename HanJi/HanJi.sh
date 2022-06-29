#!/bin/bash
gpio -g mode 26 input
gpio -g mode 26 down

$(python3 /home/hwi/문서/Git/GPIO_Test3.py)&

while [ True ]
do

echo $(date "+%Y-%m-%d %H:%M:%S")
pin=`gpio -g read 26`
on=1

if [ $pin -eq $on ];then
echo "스위치 ON 감지 \n"
#echo "$pin \n"
$(vlc /home/hwi/문서/Git/Building.mp4)


else
echo "입력 없음 \n"
#echo "$pin \n"

fi

sleep 0.1

done
