# vagrant plugin install vagrant-vbguest
Vagrant.configure("2") do |config|
  config.vm.box = "debian/buster64"
  config.vm.network "private_network", ip: "192.168.19.94"
  config.vm.synced_folder ".", "/home/vagrant/oauth"
  config.vm.provision "shell", path: "provision.sh"
end
