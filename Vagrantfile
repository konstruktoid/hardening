Vagrant.configure("2") do |config|
  config.vbguest.installer_options = { allow_kernel_upgrade: true }
  config.vm.provider "virtualbox" do |v|
    v.default_nic_type = "Am79C973"
    v.memory = 2048
    v.cpus = 2
    v.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
    v.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
  end

  config.vm.define "focal" do |focal|
    focal.ssh.extra_args = ["-o","ConnectTimeout=600"]
    focal.ssh.insert_key = true
    focal.vm.boot_timeout = 600
    focal.vm.box = "ubuntu/focal64"
    focal.vm.hostname = "focal"
  end

  config.vm.define "impish" do |impish|
    impish.ssh.extra_args = ["-o","ConnectTimeout=600"]
    impish.ssh.insert_key = true
    impish.vm.boot_timeout = 600
    impish.vm.box = "ubuntu/impish64"
    impish.vm.hostname = "impish"
  end

  config.vm.define "jammy" do |jammy|
    jammy.ssh.extra_args = ["-o","ConnectTimeout=600"]
    jammy.ssh.insert_key = true
    jammy.vm.boot_timeout = 600
    jammy.vm.box = "jammy/20220112"
    jammy.vm.box_url = "https://cloud-images.ubuntu.com/jammy/20220112.1/jammy-server-cloudimg-amd64-vagrant.box"
    jammy.vm.hostname = "jammy"
  end
end
