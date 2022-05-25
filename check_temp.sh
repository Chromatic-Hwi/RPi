#!/bin/bash
# CPU 온도 출력 

Temp_Raw=$(cat /sys/class/thermal/thermal_zone0/temp)

echo "<" $(date "+%Y-%m-%d %H:%M") ">"
echo $(echo "scale=2; $Temp_Raw/1000" |bc) "'C"

