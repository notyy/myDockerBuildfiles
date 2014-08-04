FROM notyy/hadoop-single:2.4.1
MAINTAINER notyycn <notyycn@gmail.com>
ENV PATH $PATH:$JAVA_HOME/bin
ENV HADOOP_PREFIX /usr/local/hadoop

RUN sed -i '/^export JAVA_HOME/ s:.*:export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64\nexport HADOOP_PREFIX=/usr/local/hadoop\nexport HADOOP_HOME=/usr/local/hadoop\n:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh
RUN sed -i '/^export HADOOP_CONF_DIR/ s:.*:export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop/:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

RUN sudo apt-get -qq -y install ssh openssh-server openssh-client rsync
RUN ssh-keygen -t dsa -P '' -f /root/.ssh/id_dsa
RUN cat /root/.ssh/id_dsa.pub >> /root/.ssh/authorized_keys
RUN mkdir /var/run/sshd
RUN /usr/sbin/sshd

ADD core-site.xml /usr/local/hadoop/etc/hadoop/
ADD hdfs-site.xml /usr/local/hadoop/etc/hadoop/
WORKDIR /usr/local/hadoop
RUN bin/hdfs namenode -format
RUN sbin/start-dfs.sh

CMD /bin/bash
