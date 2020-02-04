Vagrant.configure("2") do |config|
  hardening_disk01 = '/tmp/hardening_disk01.vdi'

  config.vm.provider "virtualbox" do |v|
    v.default_nic_type = "Am79C973"
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.provider "virtualbox" do |hardening_disk|
    if not File.exists?(hardening_disk01)
      hardening_disk.customize ['createhd', '--filename', hardening_disk01, '--variant', 'Standard', '--size', 5 * 1024]
    end
    hardening_disk.customize ['storageattach', :id, '--storagectl', 'SCSI', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', hardening_disk01]
  end

  config.vm.define "hardening" do |hardening|
    hardening.vm.box = "ubuntu/bionic64"
    hardening.ssh.insert_key = true
    hardening.vm.network "private_network", ip: "10.7.8.45"
    hardening.vm.hostname = "hardening"
    if ARGV[0] == "up" && ! File.exist?(hardening_disk01)
      hardening.vm.provision "shell", path: "createPartitions.sh"
    end
  end
end
