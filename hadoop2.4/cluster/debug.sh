docker run -ti --name=namenode --link datanode1:datanode1 --link datanode2:datanode2 --link datanode3:datanode3 -p 50070:50070 notyy/hadoop-master:2.4.1 /etc/bootstrap.sh -bash

docker run --name=namenode -d -p 50070:50070 notyy/hadoop-master:2.4.1

docker run --name=datanode1 -d --link namenode:namenode notyy/hadoop-slave:2.4.1

docker build -t=notyy/hadoop-master:2.4.1 .

docker build -t=notyy/hadoop-slave:2.4.1 .

172.17.0.215
