Vagrant.configure("2") do |config|
  bionic_disk01 = '/tmp/bionic_disk01.vdi'

  config.vm.provider "virtualbox" do |v|
    v.default_nic_type = "Am79C973"
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.provider "virtualbox" do |bionic_disk|
    if not File.exists?(bionic_disk01)
      bionic_disk.customize ['createhd', '--filename', bionic_disk01, '--variant', 'Standard', '--size', 5 * 1024]
    end
    bionic_disk.customize ['storageattach', :id, '--storagectl', 'SCSI', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', bionic_disk01]
  end

  config.vm.define "bionic" do |bionic|
    bionic.vm.box = "ubuntu/bionic64"
    bionic.ssh.insert_key = true
    bionic.vm.network "private_network", ip: "10.7.8.45"
    bionic.vm.hostname = "bionic"
    if ARGV[0] == "up" && ! File.exist?(bionic_disk01)
      bionic.vm.provision "shell", path: "createPartitions.sh"
    end
  end
end
