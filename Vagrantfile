Vagrant.configure("2") do |config|
  config.vm.define "xenial" do |xenial|
    xenial.vm.box = "ubuntu/xenial64"
    xenial.ssh.insert_key = true
    xenial.vm.network "private_network", ip:"10.7.8.41"
    xenial.vm.hostname = "xenial"
  end

  config.vm.define "yakkety" do |yakkety|
    yakkety.vm.box = "ubuntu/yakkety64"
    yakkety.ssh.insert_key = true
    yakkety.vm.network "private_network", ip:"10.7.8.42"
    yakkety.vm.hostname = "yakkety"
  end

  config.vm.define "zesty" do |zesty|
    zesty.vm.box = "ubuntu/zesty64"
    zesty.ssh.insert_key = true
    zesty.vm.network "private_network", ip:"10.7.8.43"
    zesty.vm.hostname = "zesty"
  end
end
