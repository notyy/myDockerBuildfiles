FROM notyy/ubuntu14_jre7:v1
MAINTAINER notyycn <notyycn@gmail.com>
RUN sudo apt-get install -qq -y wget
RUN sudo apt-get install -qq -y unzip
RUN cd /tmp
RUN wget http://download.go.cd/gocd-deb/go-server-14.2.0-377.deb
RUN sudo mkdir /var/lib/go-server
RUN sudo adduser go
RUN mkdir /home/go
RUN sudo chown go /var/lib/go-server/
RUN sudo dpkg -i go-server-14.2.0-377.deb
RUN sudo apt-get -qq clean
RUN sudo rm -rf /tmp/go-server-14.2.0-377.deb
#RUN sudo /etc/init.d/go-server start
EXPOSE 8153
