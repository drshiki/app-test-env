FROM httpd:2.4

MAINTAINER ATP atp@dam.moe

RUN  sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    sed -i 's/security.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    apt-get update && \ 
    apt-get install apache2 libapache2-mod-jk -y && \
    echo 'Include /etc/apache2/mods-available/jk.load' >> /usr/local/apache2/conf/httpd.conf && \
    echo 'Include /etc/apache2/mods-available/httpd-jk.conf' >> /usr/local/apache2/conf/httpd.conf && \
    echo 'Include /etc/apache2/sites-available/000-default.conf' >> /usr/local/apache2/conf/httpd.conf
 
 COPY ./workers.properties /etc/libapache2-mod-jk/workers.properties
 copy ./000-default.conf  /etc/apache2/sites-available/000-default.conf

CMD apachectl -D FOREGROUND