ARG VERSION

FROM tensorflow/tensorflow:$VERSION

RUN apt update && apt install -y vim tmux
RUN apt-get install -y libsm6 libxext6 libxrender-dev

RUN pip3 install -U pip
RUN pip3 install opencv-python wget
