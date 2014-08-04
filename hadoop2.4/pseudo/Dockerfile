FROM notyy/hadoop-single:2.4.1
MAINTAINER notyycn <notyycn@gmail.com>
RUN sudo apt-get -qq -y install ssh openssh-server openssh-client rsync
RUN ssh-keygen -t dsa -P '' -f /root/.ssh/id_dsa
RUN cat /root/.ssh/id_dsa.pub >> /root/.ssh/authorized_keys
ADD core-site.xml /usr/local/hadoop/etc/hadoop/
ADD hdfs-site.xml /usr/local/hadoop/etc/hadoop/
WORKDIR /usr/local/hadoop
RUN bin/hdfs namenode -format
CMD /bin/bash
