#!/bin/bash
/usr/bin/xhost +

HOME=$HOME
#default=1.13.1-gpu-py3
default=1.0
tag=${1:-$default}
echo $tag
  #tensorflow/tensorflow:$tag \
NAME=tf${USER}$(date +%Y%m%d%H%M%S) 

#if [[ "$(nvidia-docker images -q tensorflow/tensorflow:$tag 2> /dev/null)" == "" ]] ; then
#  sudo docker build -t tensorflow/tensorflow:$tag ./ --build-arg VERSION=$tag
#fi

sudo nvidia-docker run -it \
  --name ${NAME}_${tag} \
	--privileged \
  -v /etc/group:/etc/group:ro \
  -v /etc/passwd:/etc/passwd:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/video0:/dev/video0 \
  -v $HOME:$HOME \
  -u=$UID:$(id -g $USER) \
  -w=$(pwd) \
	-e DISPLAY=$DISPLAY \
	-e TZ=Asia/Seoul \
  -e QT_X11_NO_MITSHM=1 \
  -p 6006:6006 \
  tfdetection:$tag \
  /bin/bash

  #-e CUDA_VISIBLE_DEVICES=0 \
#docker exec -it ${NAME}_${tag} tmux
#  /bin/bash

