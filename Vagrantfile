Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.default_nic_type = "Am79C973"
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.define "bionic" do |bionic|
    bionic.vm.box = "ubuntu/bionic64"
    bionic.ssh.insert_key = true
    bionic.vm.network "private_network", ip: "10.7.8.45"
    bionic.vm.hostname = "bionic"
  end

  config.vm.define "cosmic" do |cosmic|
    cosmic.vm.box = "ubuntu/cosmic64"
    cosmic.ssh.insert_key = true
    cosmic.vm.network "private_network", ip: "10.7.8.47"
    cosmic.vm.hostname = "cosmic"
  end

  config.vm.define "standard" do |standard|
    standard.vm.box = "ubuntu/bionic64"
    standard.ssh.insert_key = true
    standard.vm.network "private_network", ip: "10.7.8.49"
    standard.vm.hostname = "standard"
  end

  config.vm.define "disco" do |disco|
    disco.vm.box = "ubuntu/disco64"
    disco.ssh.insert_key = true
    disco.vm.network "private_network", ip: "10.7.8.51"
    disco.vm.hostname = "disco"

    config.vm.provider "virtualbox" do |disk01|
      disco_disk01 = './disco_disk01.vdi'
      if not File.exists?(disco_disk01)
        disk01.customize ['createhd', '--filename', disco_disk01, '--variant', 'Standard', '--size', 5 * 1024]
      end
      disk01.customize ['storageattach', :id, '--storagectl', 'SCSI', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', disco_disk01]

      if ARGV[0] == "up" && ! File.exist?(disco_disk01)
        disco.vm.provision "shell", path: "createPartitions.sh"
      end
    end
  end
end
