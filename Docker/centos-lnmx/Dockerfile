FROM centos:centos6.7
MAINTAINER tomoyuki.koube <tomoyuki.koube@grrow.bz>

RUN yum -y install http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm && \
	> /dev/null && yum -y install mysql-community-server >& /dev/null && chkconfig mysqld on
