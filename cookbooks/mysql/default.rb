package 'mariadb-libs' do
  action :remove
end

mysql_rpm = 'mysql57-community-release-el7-10.noarch.rpm'
http_request "get rpm" do
  path "/tmp/#{mysql_rpm}"
  url "https://dev.mysql.com/get/#{mysql_rpm}"
  not_if "test -e /etc/yum.repos.d/mysql-community.repo"
end

execute 'Install mysql rpm' do
  command "rpm -i /tmp/#{mysql_rpm}"
#  not_if File.exists?('/etc/yum.repos.d/mysql-community.repo')
  not_if "test -e /etc/yum.repos.d/mysql-community.repo"
end

package 'mysql-server'

service 'mysqld' do
  action [:enable, :start]
end

# 初回ログインはできない？
# cat /var/log/mysqld.log | grep generate
# mysqladmin -u root password  -p <現在のパスワード>
# KI92u3!kjoa
#
# wp用のDB・ユーザを作る
#> CREATE USER 'wordpress_user'@'192.168.1.%' IDENTIFIED BY 'ぱすわーど';
#> CREATE DATABASE wordpress_db;
#> GRANT ALL ON wordpress_db.* TO wordpress_user;
#> FLUSH PRIVILEGES;
#> quit
