package 'unzip'

directory '/var/www/html' do
  mode '777'
end

http_request 'Download wordpress' do
  path '/var/www/html/wordpress-4.7.3-ja.tar.gz'
  url 'https://ja.wordpress.org/wordpress-4.7.3-ja.tar.gz'
  mode '755'
end

# 動かないケースが多い。謎
execute 'deploy wordpress' do
  command "tar -xzf /var/www/html/wordpress-4.7.3-ja.tar.gz"
  not_if "test -d /var/www/html/wordpress"
end

directory '/var/www/html/wordpress' do
  mode '777'
end

execute 'chown' do
  command 'chown -R nginx:nginx /var/www/html/wordpress'
  notifies :restart, "service[nginx]"
end
