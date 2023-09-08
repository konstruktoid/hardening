Vagrant.configure("2") do |config|
  config.vbguest.installer_options = { allow_kernel_upgrade: true }
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

  config.vm.define "lunar" do |lunar|
    lunar.ssh.extra_args = ["-o","ConnectTimeout=600"]
    lunar.ssh.insert_key = true
    lunar.vm.boot_timeout = 600
    lunar.vm.box = "ubuntu/lunar64"
    lunar.vm.hostname = "lunar"
  end

  config.vm.define "mantic" do |mantic|
    mantic.ssh.extra_args = ["-o","ConnectTimeout=600"]
    mantic.ssh.insert_key = true
    mantic.vm.boot_timeout = 600
    mantic.vm.box = "ubuntu/mantic64"
    mantic.vm.hostname = "mantic"
  end
end
