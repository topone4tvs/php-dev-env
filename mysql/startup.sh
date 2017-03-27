#!/bin/sh
if [ -f "/data/mysql/init.lock" ]; then
    echo "mysql has been initialized\n"
    exec /usr/bin/mysqld --user=root --console
    exit;
fi

mysql_install_db --user=root > /dev/null
if [ 1 -ne $? ]
then
    echo "mysql start error\n"
    exit
fi

/usr/bin/mysqladmin -u root password "$MYSQL_ROOT_PASSWORD"

tfile=`mktemp`
if [ ! -f "$tfile" ]; then
    return 1
fi

cat << EOF > $tfile
USE mysql;
UPDATE user SET host="%" WHERE user='root' AND host='localhost';
FLUSH PRIVILEGES;
EOF

echo "[i] Creating database: $MYSQL_DATABASE"
echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;" >> $tfile

echo "[i] Creating user: $MYSQL_USER with password $MYSQL_PASSWORD"
echo "GRANT ALL ON *.* to '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> $tfile
echo "FLUSH PRIVILEGES;" >> $tfile

/usr/bin/mysqld --user=root --bootstrap --verbose=0 < $tfile
rm -f $tfile

touch /data/mysql/init.lock

