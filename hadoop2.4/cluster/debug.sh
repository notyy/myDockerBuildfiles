docker run -ti --name=namenode --link datanode1:datanode1 --link datanode2:datanode2 --link datanode3:datanode3 -p 50070:50070 notyy/hadoop-master:2.4.1 /etc/bootstrap.sh -bash

docker run --name=namenode -d -h=namenode -p 50070:50070 -p 8088:8088 -p 19888:19888 notyy/hadoop-master:2.4.1

docker run --name=namenode -ti -h=namenode -p 50070:50070 -p 8088:8088 -p 19888:19888 notyy/hadoop-master:2.4.1 /etc/bootstrap.sh -bash



docker run --name=datanode1 -d -h=datanode1 --link namenode:namenode notyy/hadoop-slave:2.4.1
docker run --name=datanode2 -d -h=datanode2 --link namenode:namenode notyy/hadoop-slave:2.4.1
docker run --name=datanode3 -d -h=datanode3 --link namenode:namenode notyy/hadoop-slave:2.4.1
docker run --name=datanode4 -d -h=datanode4 --link namenode:namenode notyy/hadoop-slave:2.4.1

docker run --name=datanode1 -ti -h=datanode1 --link namenode:namenode notyy/hadoop-slave:2.4.1 /etc/bootstrap.sh -bash

docker build -t=notyy/hadoop-master:2.4.1 .

docker build -t=notyy/hadoop-slave:2.4.1 .

172.17.0.215

hadoop dfsadmin -refreshNodes
