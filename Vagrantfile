# -*- mode: ruby -*-
# vi: set ft=ruby :

require_relative './bootstrap'

Vagrant.configure("2") do |config|
   config.vm.synced_folder "./mean_o", "/home/vagrant/mean"

   config.vm.provider "virtualbox" do |v|
     v.customize ["modifyvm", :id, "--cpus", "2"]
   end

  $config['ip'].each do | host_name, host_ip |
    config.vm.define "#{host_name}" do |node|
      node.vm.box = "bento/ubuntu-16.04"
      node.vm.hostname = "#{host_name}"
      node.vm.network :private_network, ip: host_ip
      node.vm.provision "shell", :path => File.join(File.dirname(__FILE__),"scripts/#{host_name}.sh"), :args => node.vm.hostname 
      
      node.vm.provider :virtualbox do |vb|
         vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
         vb.customize ["modifyvm", :id, "--memory", "2048"]
      end
    end
  end

end