#!/bin/bash

# ~/.gitconfig 가 있는지 검사 후 없으면 user.name, user.email 을 등록하는 function.
function chkconfig {
	if [ -r $CONFIG && -w $CONFIG ];then
		if [ $CHK_CONFIG_NAME -eq 0 ];then
			read -p "*Enter your git user name: " GIT_NM
			git config --global user.name $GIT_NM
		fi

		if [ $CHK_CONFIG_EMAIL -eq 0 ];then
			read -p "*Enter your E-mail address: " GIT_EMAIL
			git config --global user.email $GIT_EMAIL
		fi

		else
			read -p "*Enter your git user name: " GIT_NM
			git config --global user.name  $GIT_NM

			read -p "*Enter your E-mail Address: " GIT_EMAIL
			git config --global user.email $GIT_EMAIL
	fi
 }

CONFIG=${HOME}/.gitconfig

# .gitconfig 를 읽어서 'name = ' 필드가 채워져 있는지 검사.
CHK_CONFIG_NAME=$(grep name ~/.gitconfig | awk -F'name = ' '{print $2}' | wc -c)

# .gitconfig 를 읽어서 'email = ' 필드가 채워져 있는지 검사.
CHK_CONFIG_EMAIL=$(grep name ~/.gitconfig | awk -F'email = ' '{print $2}' | wc -c)

# 현재 위치에 .git 디렉토리가 없으면 git 사용 프로젝트가 아니므로 종료.
if [ ! -d .git ]; then
	echo '.git 디렉토리가 없습니다!'
	exit 1
fi

chkconfig()

# .gitconfig 파일이 생성되지 않은 경우
if [ ! -r ${HOME}/.gitconfig ];then
	echo ${HOME}/'gitconfig 파일이 생성되지 않았습니다. 직접 설정하세요.'
	exit 1
fi

# 내용 변경점을 불러옴.
git fetch --all
git pull

#=====================================================================
echo "<< Start GitHub Push >>"

# 문구 바로 옆에 입력 받는 형식
read -p "*Enter the commit message: " CM

# git에 $CM 변수를 바로 전달.
git commit -m $CM

git branch -M main

git push origin main

echo "<< Push Success! >>"

#=====================================================================
