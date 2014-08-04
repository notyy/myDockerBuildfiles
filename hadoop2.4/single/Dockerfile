FROM notyy/ubuntu_jre7:v1
MAINTAINER notyycn <notyycn@gmail.com>
RUN sudo apt-get -qq update
RUN sudo apt-get -qq -y install curl
RUN curl -s http://www.apache.org/dist/hadoop/common/hadoop-2.4.1/hadoop-2.4.1.tar.gz | tar -xz -C /usr/local/
RUN cd /usr/local && ln -s ./hadoop-2.4.1 hadoop
