FROM notyy/ubuntu14_jre8:v1
MAINTAINER notyycn <notyycn@gmail.com>
RUN sudo apt-get install -qq -y wget
RUN sudo apt-get install -qq -y unzip
RUN cd /tmp
RUN wget http://download.go.cd/gocd-deb/go-server-14.2.0-377.deb
# RUN sudo mkdir /var/lib/go-server
# RUN mkdir /var/go
# RUN sudo useradd -d /var/go go
# RUN sudo chown go /var/lib/go-server
RUN sudo dpkg -i go-server-14.2.0-377.deb
RUN sudo apt-get -qq clean
RUN sudo rm -rf /tmp/go-server-14.2.0-377.deb
EXPOSE 8153
# CMD sudo /etc/init.d/go-server start
CMD /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java -server  -Xms512m -Xmx1024m -XX:PermSize=128m -XX:MaxPermSize=256m    -Duser.language=en -Dorg.mortbay.jetty.Request.maxFormContentSize=30000000 -Djruby.rack.request.size.threshold.bytes=30000000 -Duser.country=US -Dcruise.config.dir=/etc/go -Dcruise.config.file=/etc/go/cruise-config.xml -Dcruise.server.port=8153 -Dcruise.server.ssl.port=8154 -jar /usr/share/go-server/go.jar
