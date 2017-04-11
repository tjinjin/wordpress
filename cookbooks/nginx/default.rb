remote_file '/etc/yum.repos.d/nginx.repo' do
  source 'files/nginx.repo'
end

package 'nginx'

service 'nginx' do
  action [:enable]
end

file '/etc/nginx/conf.d/default.conf' do
  action :delete
end

remote_file '/etc/nginx/conf.d/wordpress.conf' do
  source 'files/wordpress.conf'
  notifies :reload, "service[nginx]"
end
