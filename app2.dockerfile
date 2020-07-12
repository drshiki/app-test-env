FROM tomcat:9.0.36-jdk8-openjdk

MAINTAINER ATP atp@dam.moe

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    sed -i 's/security.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    apt-get update && \ 
    apt-get install netcat -y

COPY ./app2-server.xml /usr/local/tomcat/conf/server.xml

COPY ./entrypoint.sh /usr/local/tomcat/bin/entrypoint.sh