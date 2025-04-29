FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && \
    apt-get install -y mariadb-server apache2 php php-mysqli libapache2-mod-php wget unzip supervisor && \
    apt-get clean

# Create necessary directories for MariaDB
RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql /var/run/mysqld && \
    chmod 755 /var/run/mysqld

# phpMyAdmin installation
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.2.1/phpMyAdmin-5.2.1-all-languages.zip && \
    unzip phpMyAdmin-5.2.1-all-languages.zip && \
    mv phpMyAdmin-5.2.1-all-languages /var/www/html/phpmyadmin && \
    rm phpMyAdmin-5.2.1-all-languages.zip

# Copy config files
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY start.sh /start.sh
COPY init.sql /init.sql

# Make the script executable
RUN chmod +x /start.sh

# Expose ports for Apache and MariaDB
EXPOSE 80 3306

# Start everything via custom script
CMD ["/start.sh"]
