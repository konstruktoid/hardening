Vagrant.configure("2") do |config|
  config.vm.define "xenial" do |xenial|
    xenial.vm.box = "bento/ubuntu-16.04"
    xenial.ssh.insert_key = true
    xenial.vm.network "private_network", ip:"10.7.8.41"
    xenial.vm.hostname = "xenial"
  end

  config.vm.define "artful" do |artful|
    artful.vm.box = "bento/ubuntu-17.10"
    artful.ssh.insert_key = true
    artful.vm.network "private_network", ip:"10.7.8.44"
    artful.vm.hostname = "artful"
  end

  config.vm.define "bionic" do |bionic|
    bionic.vm.box = "ubuntu/bionic64"
    bionic.ssh.insert_key = true
    bionic.vm.network "private_network", ip:"10.7.8.45"
    bionic.vm.hostname = "bionic"
  end
end
