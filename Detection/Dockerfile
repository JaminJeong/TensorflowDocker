ARG VERSION

FROM tensorflow/tensorflow:$VERSION

RUN apt update && apt install -y vim tmux git wget
RUN apt-get install -y libsm6 libxext6 libxrender-dev
RUN apt-get install -y protobuf-compiler python3-pil python3-lxml python3-tk

RUN pip3 install -U pip

RUN pip3 install Cython
RUN pip3 install contextlib2
RUN pip3 install pillow
RUN pip3 install lxml
RUN pip3 install jupyter
RUN pip3 install matplotlib

RUN pip3 install opencv-python wget
