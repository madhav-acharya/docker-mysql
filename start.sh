#!/bin/bash
echo "Starting services..."

# Initialize MariaDB only if not already initialized
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB..."
    mysqld --initialize-insecure --user=mysql
    chown -R mysql:mysql /var/lib/mysql
fi

# Ensure correct ownership every time
chown -R mysql:mysql /var/lib/mysql

# Start MariaDB and Apache via Supervisor
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf &

# Wait until MariaDB is up before executing init.sql
echo "Waiting for MariaDB to be available..."
until mysqladmin ping --silent; do
    sleep 1
done

echo "Running init.sql..."
mysql -u root < /init.sql

# Keep container running
wait
