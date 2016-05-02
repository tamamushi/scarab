FROM grrowjp/centos67-base
MAINTAINER tomoyuki.koube <tomoyuki.koube@grrow.bz>

ENV MYSQL_MAJOR 5.7
ENV MYSQL_VERSION 5.7.12

RUN set -x \
	&& groupadd -r mysql && useradd -r -g mysql mysql \
	&& mkdir /docker-entrypoint-initdb.d \
	&& rm -rf /var/lib/mysql && mkdir -p /var/lib/mysql \
	&& yum -y install expect > /dev/null 2>&1 \
	&& yum -y install http://dev.mysql.com/get/mysql57-community-release-el6-7.noarch.rpm > /dev/null \
	&& yum -y install mysql-community-server-${MYSQL_VERSION} > /dev/null 2>&1 \
	&& sed -Ei 's/^(bind-address|log)/#&/' /etc/my.cnf \
	&& echo -e 'skip-host-cache\nskip-name-resolve\ncharacter-set-server = utf8\nuser = mysql' | awk \
		'{ print } $1 == "[mysqld]" && c == 0 { c = 1; system("cat") }' /etc/my.cnf > /tmp/my.cnf \
	&& cp /tmp/my.cnf /etc/my.cnf && chkconfig mysqld on 

VOLUME /var/lib/mysql
VOLUME /var/www/html
COPY docker-entrypoint.sh /usr/local/bin/

RUN set -x \
	&& chmod +x /usr/local/bin/docker-entrypoint.sh \
	&& ln -s /usr/local/bin/docker-entrypoint.sh /entrypoint.sh \
	&& curl -nL http://www.hop5.in/yum/el6/hop5.repo > /etc/yum.repos.d/hop5.repo \
	&& yum -y install https://s3-ap-northeast-1.amazonaws.com/opendoc/apr-1.5.2-1.x86_64.rpm \
	 https://s3-ap-northeast-1.amazonaws.com/opendoc/apr-util-1.5.4-1.x86_64.rpm \
	 https://s3-ap-northeast-1.amazonaws.com/opendoc/libmcrypt-2.5.8-9.el6.x86_64.rpm \
	 https://s3-ap-northeast-1.amazonaws.com/opendoc/liblcms2-2.4-1.el6.x86_64.rpm \
	 https://s3-ap-northeast-1.amazonaws.com/opendoc/httpd-2.4.20-1.x86_64.rpm \
	 hhvm > /dev/null 2>&1 \
	&& mkdir -p /var/run/hhvm /var/log/hhvm /var/log/httpd \
	&& chown apache:apache /var/run/hhvm /var/log/hhvm /var/log/httpd

COPY httpd.conf /etc/httpd/conf/httpd.conf
COPY php.ini /etc/hhvm/php.ini
COPY server.hdf /etc/hhvm/server.hdf
COPY hhvm /etc/init.d/hhvm

RUN set -x \
	&& yum clean all && rm -rf /var/tmp/* && chmod +x /etc/init.d/hhvm

ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 3306 80
CMD ["mysqld"]
