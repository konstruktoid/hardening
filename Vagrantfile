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
    focal.vm.network "private_network", ip: "10.7.8.45"
  end

#  https://bugs.launchpad.net/ubuntu/+source/aide/+bug/1903298
#  config.vm.define "hirsute" do |hirsute|
#    hirsute.ssh.extra_args = ["-o","ConnectTimeout=600"]
#    hirsute.ssh.insert_key = true
#    hirsute.vm.boot_timeout = 600
#    hirsute.vm.box = "ubuntu/hirsute64"
#    hirsute.vm.hostname = "hirsute"
#    hirsute.vm.network "private_network", ip: "10.7.8.47"
#  end

  config.vm.define "impish" do |impish|
    impish.ssh.extra_args = ["-o","ConnectTimeout=600"]
    impish.ssh.insert_key = true
    impish.vm.boot_timeout = 600
    impish.vm.box = "impish/20210904"
    impish.vm.box_url = "https://cloud-images.ubuntu.com/impish/20210904/impish-server-cloudimg-amd64-vagrant.box"
    impish.vm.hostname = "impish"
    impish.vm.network "private_network", ip: "10.7.8.48"
  end
end
