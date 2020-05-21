# Creates tensorflow & pytorch on jupyter
#
# docker build -t jupyter:2.0.0b1 .
#
# docker run --runtime=nvidia -itd --name ai -h ai -p 8888:8888 -p 6006:6006 -p 2222:22 -v /data/ai:/home jupyter:2.0.0b1
#
# port 8888 for jupyter
# prot 6006 for tensorboard
# port 2222 for ssh

FROM tensorflow/tensorflow:2.0.0-gpu-py3
MAINTAINER jmjeong 

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
  apt-get install -y tzdata
ENV TZ=Asia/Seoul

RUN apt-get update && \
  apt-get install -y vim openssh-server python3-tk python3-pip python3-dev git tmux tree htop && \
  mkdir /var/run/sshd && \
  pip install torchvision scipy tqdm easydict && \
  echo "root:1234" | chpasswd && \
  sed -i "s/xterm-color/xterm-256color/" /root/.bashrc && \
  echo "/usr/sbin/sshd" >> /etc/bash.bashrc && \
  sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/" /etc/ssh/sshd_config && \
  sed -i "s/#X11UseLocalhost yes/X11UseLocalhost no/" /etc/ssh/sshd_config && \
  sed -i "s:/usr/lib/openssh/sftp-server:internal-sftp:" /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

RUN add-apt-repository ppa:mystic-mirage/pycharm && \
  apt-get update && \
  apt-get install -y pycharm-community

# visual studio code web : https://github.com/cdr/code-server
RUN curl -sSOL https://github.com/cdr/code-server/releases/download/v3.3.1/code-server_3.3.1_amd64.deb && \
  dpkg -i -y code-server_3.3.1_amd64.deb && \
  systemctl --user enable --now code-server
# Now visit http://127.0.0.1:8080. Your password is in ~/.config/code-server/config.yaml


