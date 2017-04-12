## wordpressインストール

## mysqlの初期設定

```
$ cat /var/log/mysqld.log | grep generate
$ mysqladmin -u root password -p
u%WAi2ho&GoB!4
$ mysql -u root -p

mysql> create database wordpress;
mysql> grant all privileges on wordpress.* to wordpress@localhost identified by 'AKEi9jjj82!';
```

## ブラウザで設定
- http://192.168.33.10/wp-admin/setup-config.phpにアクセス


## 対障害性を高めるには？

