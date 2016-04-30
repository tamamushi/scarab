FROM grrowjp/centos67-base
MAINTAINER tomoyuki.koube <tomoyuki.koube@grrow.bz>

ENV MYSQL_PASS mysql
ENV MYSQL_MAJOR 5.7

RUN set -x \
	&& groupadd -r mysql && useradd -r -g mysql mysql \
	&& mkdir /docker-entrypoint-initdb.d \
	&& yum -y install http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm > /dev/null \
	&& yum -y install mysql-community-server > /dev/null 2>&1 \
	&& yum clean all \
	&& rm -rf /var/lib/mysql && mkdir -p /var/lib/mysql \
	&& sed -Ei 's/^(bind-address|log)/#&/' /etc/my.cnf \
	&& echo -e 'skip-host-cache\nskip-name-resolve\ncharacter-set-server = utf8' | awk \
		'{ print } $1 == "[mysqld]" && c == 0 { c = 1; system("cat") }' /etc/my.cnf > /tmp/my.cnf \
	&& cp /tmp/my.cnf /etc/my.cnf && chkconfig mysqld on \
	&& service mysqld start > /dev/null 2>&1 && sleep 10 \
	&& /usr/bin/mysql -uroot -e 'DROP DATABASE IF EXISTS test;' \
	&& /usr/bin/mysql -uroot -e "DELETE FROM mysql.user where user = '';" -D mysql \
	&& /usr/bin/mysql -uroot -e "DELETE FROM mysql.user WHERE user='root' \ 
			AND Host NOT IN ('localhost', '127.0.0.1', '::1');" -D mysql \
	&& /usr/bin/mysql -uroot -e "SET PASSWORD FOR 'root'@'::1' = PASSWORD(\"${MYSQL_PASS}\");" -D mysql \
	&& /usr/bin/mysql -uroot -e "SET PASSWORD FOR 'root'@'127.0.0.1' = PASSWORD(\"${MYSQL_PASS}\");" -D mysql \
	&& /usr/bin/mysql -uroot -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD(\"${MYSQL_PASS}\");" -D mysql \
	&& /bin/bash -c '/usr/bin/mysqladmin --defaults-extra-file=<(printf '[client]\npassword=%s' ${MYSQL_PASS}) -uroot flush-privileges'

EXPOSE 3306

