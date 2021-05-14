# Derived from official mysql image (our base image)
FROM mysql:8.0.22

RUN sed -i '/^\[mysqld\]$/a\default-authentication-plugin=mysql_native_password\ninnodb-ft-min-token-size=1\nlog-bin-trust-function-creators=1' /etc/mysql/my.cnf

WORKDIR /var/www/html/
COPY waitForMySQL.sh /var/www/html/
RUN chmod +rwx waitForMySQL.sh

CMD ["mysqld"]