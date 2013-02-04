# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "centos62-ruby193-postgres84"
  config.vm.box_url = "http://vagrant.mosaicbms.com/centos62-ruby193-postgres84.box"

  config.vm.network :hostonly, '172.27.27.110'
  config.vm.share_folder "library", "/var/www/apps/library", ".", :nfs => true
  config.vm.provision :shell, :path => "config/vagrant/library.sh"

  config.vm.host_name = "library.vm"
end
