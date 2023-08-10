<div align="center"><h2>mysql-compose</h2></div>

[TOC]

***

# 启动 mysql

## 1. 执行初始化脚本

```shell
:~/compose/mysql# bash init.sh 
Mysql: Init Success !
```

## 2. 启动 mysql

```shell
:~/compose/mysql# docker-compose up -d
[+] Running 2/2
 ✔ Network mysql_default    Created                                                     0.1s 
 ✔ Container mysql-mysql-1  Started                                                     0.5s
```

## 3. 检查 mysql 状态

```shell
:~/compose/mysql# docker-compose ps -a
NAME                IMAGE                    COMMAND                  SERVICE             CREATED             STATUS              PORTS
mysql-mysql-1       docker.io/mysql:5.7.32   "docker-entrypoint.s…"   mysql               2 minutes ago       Up 2 minutes        0.0.0.0:3306->3306/tcp, :::3306->3306/tcp, 33060/tcp
```

# 使用容器启动 mysql 客户端

```shell
# 启动时直接连接
docker run -it --rm \
    --network=host \
    --name=mysql-client-tmp \
    -v /tmp/:/tmp \
    mysql:5.7.32 mysql -h127.0.0.1 -uroot -pmysql.123
# 执行 sql 命令
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+


# 启动之后手动连接
docker run -it --rm \
    --network=host \
    --name=mysql-client-tmp \
    -v /tmp/:/tmp \
    mysql:5.7.32 /bin/bash
mysql -h127.0.0.1 -uroot -pmysql.123

# 执行 sql 命令
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
```











