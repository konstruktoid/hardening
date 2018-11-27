Vagrant.configure("2") do |config|

  config.vm.define "artful" do |artful|
    artful.vm.box = "ubuntu/artful64"
    artful.ssh.insert_key = true
    artful.vm.network "private_network", ip:"10.7.8.43"
    artful.vm.hostname = "artful"
  end

  config.vm.define "bionic" do |bionic|
    bionic.vm.box = "ubuntu/bionic64"
    bionic.ssh.insert_key = true
    bionic.vm.network "private_network", ip:"10.7.8.45"
    bionic.vm.hostname = "bionic"
  end

  config.vm.define "cosmic" do |cosmic|
    cosmic.vm.box = "ubuntu/cosmic64"
    cosmic.ssh.insert_key = true
    cosmic.vm.network "private_network", ip:"10.7.8.47"
    cosmic.vm.hostname = "cosmic"
  end

  config.vm.define "basic" do |basic|
    basic.vm.box = "ubuntu/bionic64"
    basic.ssh.insert_key = true
    basic.vm.network "private_network", ip:"10.7.8.49"
    basic.vm.hostname = "basic"
  end

  config.vm.define "disco" do |disco|
    disco.vm.box = "ubuntu/disco64"
    disco.ssh.insert_key = true
    disco.vm.network "private_network", ip:"10.7.8.51"
    disco.vm.hostname = "disco"
  end
end
