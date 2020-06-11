#!/bin/bash
/usr/bin/xhost +

sudo nvidia-docker run -it \
  -v /home:/home \
  --name tf2_0 \
  -p 26006:6006 \
  -p 28881:8881 \
  -p 28081:8081 \
  -p 2220:22 \
  tensorflow_2_dev \
