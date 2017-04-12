package 'php'
package 'php-mysql'
package 'php-fpm'

remote_file '/etc/php-fpm.d/www.conf' do
  source 'files/www.conf'
  notifies :restart,"service[php-fpm]"
end

service 'php-fpm' do
  action [:enable, :start]
end
