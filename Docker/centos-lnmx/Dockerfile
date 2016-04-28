FROM centos:centos6.7
MAINTAINER tomoyuki.koube <tomoyuki.koube@grrow.bz>

ENV

RUN yum -y install http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm && \
	> /dev/null && yum -y install mysql-community-server > /dev/null 2>&1 && \
	chkconfig mysqld on && service mysqld start && sleep 10 && \
	/usr/bin/mysql -uroot -e 'DROP DATABASE IF EXISTS test;'; && \
	/usr/bin/mysql -uroot -e "DELETE from mysql.user where user = '';" -D mysql && \
	/usr/bin/mysql -uroot -e "DELETE FROM mysql.user WHERE user='root' AND Host NOT \
										IN ('localhost', '127.0.0.1', '::1');" -D mysql && \
	/usr/bin/mysql -uroot -e "SET PASSWORD FOR 'root'@'::1' = PASSWORD($DB_PASS);" -D mysql && \
	/usr/bin/mysql -uroot -e "SET PASSWORD FOR 'root'@'127.0.0.1' = PASSWORD($DB_PASS);" -D mysql && \
	/usr/bin/mysql -uroot -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD($DB_PASS);" -D mysql && \
	/usr/bin/mysql --defaults-extra-file=<(printf '[client]\npassword=%s' $DB_PASS) -uroot \
					-e "GRANT ALL PRIVILEGES ON *.* to root@'192.168.%' identified by '$DB_PASS' with \
					grant option;" -D mysql
	/usr/bin/mysqladmin --defaults-extra-file=<(printf '[client]\npassword=%s' ${pass}) -uroot flush-privileges 
