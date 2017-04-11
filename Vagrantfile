# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.ssh.insert_key = false

  config.vm.define :centos do |centos|
    centos.vm.box = "bento/centos-7.2"
    centos.vm.network "private_network", ip: "192.168.33.10"
    centos.cache.scope = :box if Vagrant.has_plugin? 'vagrant-cachier'
  end
end
