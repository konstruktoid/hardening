Vagrant.configure("2") do |config|
  config.vbguest.auto_update = false
  config.vm.provider "virtualbox" do |v|
    v.default_nic_type = "Am79C973"
    v.memory = 1024
    v.cpus = 2
    v.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
    v.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
  end

  config.vm.define "focal" do |focal|
    focal.ssh.extra_args = ["-o","ConnectTimeout=600"]
    focal.ssh.insert_key = true
    focal.vm.boot_timeout = 600
    focal.vm.box = "bento/ubuntu-20.04"
    focal.vm.hostname = "focal"
  end

  config.vm.define "jammy" do |jammy|
    jammy.ssh.extra_args = ["-o","ConnectTimeout=600"]
    jammy.ssh.insert_key = true
    jammy.vm.boot_timeout = 600
    jammy.vm.box = "bento/ubuntu-22.04"
    jammy.vm.hostname = "jammy"
  end

  config.vm.define "noble" do |noble|
    noble.ssh.extra_args = ["-o","ConnectTimeout=600"]
    noble.ssh.insert_key = true
    noble.vm.boot_timeout = 600
    noble.vm.box = "bento/ubuntu-24.04"
    noble.vm.hostname = "noble"
  end
end
