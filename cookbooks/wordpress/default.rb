package 'unzip'

directory '/var/www/html' do
  mode '777'
end

http_request 'Download wordpress' do
  path '/var/www/html/wordpress-4.7.3-ja.tar.gz'
  url 'https://ja.wordpress.org/wordpress-4.7.3-ja.tar.gz'
  mode '755'
end

execute 'deploy wordpress' do
  command 'tar -xzf wordpress-4.7.3-ja.tar.gz'
  cwd '/var/www/html/'
end

directory '/var/www/html/wordpress' do
  mode '755'
end

execute 'chown' do
  command "chown -R nginx:nginx /var/www/html/wordpress"
  notifies :restart, "service[nginx]"
end
