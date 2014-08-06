FROM ubuntu:14.10
MAINTAINER notyycn <notyycn@gmail.com>
RUN sudo apt-get -qq update
RUN sudo apt-get install vim wget curl -qq -y 
RUN sudo apt-get install openjdk-7-jre-headless -qq -y
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
RUN sudo apt-get -qq clean
