# mostly steal from sequenceiq's great Builderfile https://registry.hub.docker.com/u/sequenceiq/hadoop-docker/dockerfile
# adapt to ubuntu14.10

FROM notyy/hadoop-single:2.4.1
MAINTAINER notyycn <notyycn@gmail.com>
#ENV PATH $PATH:$JAVA_HOME/bin
ENV HADOOP_PREFIX /usr/local/hadoop

RUN sed -i '/^export JAVA_HOME/ s:.*:export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64\nexport HADOOP_PREFIX=/usr/local/hadoop\nexport HADOOP_HOME=/usr/local/hadoop\n:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh
RUN sed -i '/^export HADOOP_CONF_DIR/ s:.*:export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop/:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

RUN sudo apt-get -qq -y install ssh openssh-server openssh-client rsync
RUN ssh-keygen -t dsa -P '' -f /root/.ssh/id_dsa
RUN cat /root/.ssh/id_dsa.pub >> /root/.ssh/authorized_keys
RUN mkdir /var/run/sshd
ADD ssh-config /root/.ssh/config
RUN chmod 600 /root/.ssh/config
RUN chown root:root /root/.ssh/config
# fix the 254 error code
RUN sed  -i "/^[^#]*UsePAM/ s/.*/#&/"  /etc/ssh/sshd_config
RUN echo "UsePAM no" >> /etc/ssh/sshd_config

# ADD core-site.xml /usr/local/hadoop/etc/hadoop/
ADD core-site.xml.template $HADOOP_PREFIX/etc/hadoop/core-site.xml.template
RUN sed s/HOSTNAME/localhost/ /usr/local/hadoop/etc/hadoop/core-site.xml.template > /usr/local/hadoop/etc/hadoop/core-site.xml
ADD hdfs-site.xml /usr/local/hadoop/etc/hadoop/
ADD mapred-site.xml $HADOOP_PREFIX/etc/hadoop/mapred-site.xml
ADD yarn-site.xml $HADOOP_PREFIX/etc/hadoop/yarn-site.xml

WORKDIR /usr/local/hadoop
RUN bin/hdfs namenode -format

#ENV HADOOP_COMMON_LIB_NATIVE_DIR $HADOOP_PREFIX/lib/native
# ENV HADOOP_OPTS "-Djava.library.path=$HADOOP_PREFIX/lib"
# fixing the libhadoop.so like a boss
RUN rm  /usr/local/hadoop/lib/native/*
RUN curl -Ls http://dl.bintray.com/sequenceiq/sequenceiq-bin/hadoop-native-64-2.4.1.tar|tar -x -C /usr/local/hadoop/lib/native/

ADD bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh
ENV BOOTSTRAP /etc/bootstrap.sh

#try put some data for test
RUN mkdir $HADOOP_PREFIX/input
RUN cp $HADOOP_PREFIX/etc/hadoop/*.xml $HADOOP_PREFIX/input

# workingaround docker.io build error
RUN ls -la /usr/local/hadoop/etc/hadoop/*-env.sh
RUN chmod +x /usr/local/hadoop/etc/hadoop/*-env.sh
RUN ls -la /usr/local/hadoop/etc/hadoop/*-env.sh

ENV USER root
RUN /usr/sbin/sshd && $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh && $HADOOP_PREFIX/sbin/start-dfs.sh && $HADOOP_PREFIX/bin/hdfs dfs -mkdir -p /user/root
# RUN /usr/sbin/sshd && $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh && $HADOOP_PREFIX/sbin/start-dfs.sh && $HADOOP_PREFIX/bin/hdfs dfs -put $HADOOP_PREFIX/etc/hadoop/ input

CMD ["/etc/bootstrap.sh", "-d"]

EXPOSE 50020 50090 50070 50010 50075 8031 8032 8033 8040 8042 49707 22 8088 8030 9000
