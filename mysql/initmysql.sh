#!/bin/bash


GCMD="docker run -it --rm --network=host -e DEBUG=true  -e DB_HOST=127.0.0.1 -e DB_PORT=3306 -e DB_PASS=12345678 -e DB_USER=root registry.cn-beijing.aliyuncs.com/k0s/mysql-client"

$GCMD "show databases;"

$GCMD "CREATE USER 'exporter'@'%' IDENTIFIED BY '12345678';"
$GCMD "GRANT PROCESS, REPLICATION CLIENT ON *.* TO 'exporter'@'%';"
$GCMD "GRANT SELECT ON performance_schema.* TO 'exporter'@'%';"