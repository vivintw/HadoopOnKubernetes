FROM ubuntu:18.04

MAINTAINER wilson.v@husky.neu.edu


RUN apt-get update; apt-get install -y wget openjdk-8-jre openssh-server python netcat
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin

#install download install hadoop
RUN wget https://www-eu.apache.org/dist/hadoop/common/hadoop-2.8.5/hadoop-2.8.5.tar.gz; tar -xvzf hadoop-2.8.5.tar.gz; rm hadoop-2.8.5.tar.gz

ENV HADOOP_HOME /hadoop-2.8.5
ENV HADOOP_PREFIX $HADOOP_HOME
ENV HADOOP_COMMON_HOME $HADOOP_HOME
ENV HADOOP_HDFS_HOME $HADOOP_HOME
ENV HADOOP_MAPRED_HOME $HADOOP_HOME
ENV HADOOP_YARN_HOME $HADOOP_HOME
ENV HADOOP_CONF_DIR $HADOOP_HOME/etc/hadoop
ENV YARN_CONF_DIR $HADOOP_PREFIX/etc/hadoop

ENV PATH $PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

COPY tools/ /tools/
COPY conf/ $HADOOP_CONF_DIR/
COPY entry-point /entry-point
