#!/bin/bash

echo "Start GitHub Push"
echo "Enter the commit message: "
read CM

$(sudo git config --global user.name "RPi-Hwi")
$(sudo git config --global user.emial "Chromatic_365@naver.com")

$(sudo git add /home/hwi/문서/Git)
$(sudo git commit -m echo $(CM))
$(sudo git branch -M main)

$(sudo git remote add add origin https://github.com/Chromatic-Hwi/RPi.git)

$(sudo git pull origin main)
$(sudo git push origin main)

echo "Push Success!"
