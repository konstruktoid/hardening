Vagrant.configure("2") do |config|
  hardening_disk01 = '/tmp/hardening_disk01.vdi'

  config.vm.provider "virtualbox" do |v|
    v.default_nic_type = "Am79C973"
    v.memory = 2048
    v.cpus = 2
    v.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
    v.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
  end

  config.vm.provider "virtualbox" do |hardening_disk|
    if not File.exists?(hardening_disk01)
      hardening_disk.customize ['createhd', '--filename', hardening_disk01, '--variant', 'Standard', '--size', 5 * 1024]
    end
    hardening_disk.customize ['storageattach', :id, '--storagectl', 'SCSI', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', hardening_disk01]
  end

  config.vm.define "hardening" do |hardening|
    hardening.ssh.extra_args = ["-o","ConnectTimeout=600"]
    hardening.ssh.insert_key = true
    hardening.vm.boot_timeout = 600
    hardening.vm.box = "ubuntu/focal64"
    hardening.vm.hostname = "hardening"
    hardening.vm.network "private_network", ip: "10.7.8.45"
    if ARGV[0] == "up" && ! File.exist?(hardening_disk01)
      hardening.vm.provision "shell", path: "createPartitions.sh"
    end
  end
end
