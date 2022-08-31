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

  config.vm.define "jammy" do |jammy|
    jammy.ssh.extra_args = ["-o","ConnectTimeout=600"]
    jammy.ssh.insert_key = true
    jammy.vm.boot_timeout = 600
    jammy.vm.box = "ubuntu/jammy64"
    jammy.vm.hostname = "jammy"
  end

  config.vm.define "kinetic" do |kinetic|
    kinetic.ssh.extra_args = ["-o","ConnectTimeout=600"]
    kinetic.ssh.insert_key = true
    kinetic.vm.boot_timeout = 600
    kinetic.vm.box = "ubuntu/kinetic"
    kinetic.vm.box_url = "https://cloud-images.ubuntu.com/kinetic/current/kinetic-server-cloudimg-amd64-vagrant.box"
    kinetic.vm.hostname = "kinetic"
  end
end
