Vagrant.configure("2") do |config|
  config.vm.define "xenial" do |xenial|
    xenial.vm.box = "bento/ubuntu-16.04"
    xenial.ssh.insert_key = true
    xenial.vm.network "private_network", ip:"10.7.8.41"
    xenial.vm.hostname = "xenial"
  end

  config.vm.define "bionic" do |bionic|
    bionic.vm.box = "bento/ubuntu-18.04"
    bionic.ssh.insert_key = true
    bionic.vm.network "private_network", ip:"10.7.8.45"
    bionic.vm.hostname = "bionic"
  end
end
