# Creates tensorflow & pytorch on jupyter
#
# docker build -t tensorflow_2_dev
# nvidia-docker build -t tensorflow_2_dev
#
# docker run --runtime=nvidia -itd --name ai -h ai -p 8888:8888 -p 6006:6006 -p 2222:22 -v /home:/home 
# nvidia-docker run -itd --name ai_2 -h ai_2 -p 8888:8888 -p 6006:6006 -p 2222:22 -v /home:/home 
#
# port 8888 for jupyter
# port 8080 for visual studio code web
# prot 6006 for tensorboard
# port 2222 for ssh

FROM tensorflow/tensorflow:2.0.0-gpu-py3
MAINTAINER jmjeong 

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
  apt-get install -y tzdata
ENV TZ=Asia/Seoul

RUN apt-get update && \
  apt-get install -y vim openssh-server python3-tk python3-pip git tmux tree htop wget net-tools x11-apps xfonts-base openjdk-11-jdk && \
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

# install pycharm 
#RUN add-apt-repository ppa:mystic-mirage/pycharm && \
#	apt-get update && \
#	apt-get install pycharm-community && \
RUN wget https://download-cf.jetbrains.com/python/pycharm-community-2020.1.1.tar.gz && \
  tar xzf pycharm-*.tar.gz -C /opt/ && \
  rm -f pycharm-*.tar.gz
#export PATH="/opt/pycharm-*/bin:$PATH"

## visual studio code web : https://github.com/cdr/code-server
#RUN curl -sSOL https://github.com/cdr/code-server/releases/download/v3.3.1/code-server_3.3.1_amd64.deb && \
#  dpkg -i code-server_3.3.1_amd64.deb && \
#  systemctl --user enable --now code-server
## Now visit http://127.0.0.1:8080. Your password is in ~/.config/code-server/config.yaml
# https://github.com/cdr/code-server
RUN curl -sSL https://github.com/cdr/code-server/releases/download/v3.3.1/code-server-3.3.1-linux-amd64.tar.gz | tar -C /usr/local -xz && \
  mv /usr/local/code-server-3.3.1-linux-amd64 /usr/local/code-server-3.3.1

#  export PATH="/usr/local/code-server-3.3.1/bin:$PATH"
  # Now visit http://127.0.0.1:8080. Your password is in ~/.config/code-server/config.yaml
