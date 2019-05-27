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

    config.vm.provider "virtualbox" do |disk01|
      bionic_disk01 = '/tmp/bionic_disk01.vdi'
      if not File.exists?(bionic_disk01)
        disk01.customize ['createhd', '--filename', bionic_disk01, '--variant', 'Standard', '--size', 5 * 1024]
      end
      disk01.customize ['storageattach', :id, '--storagectl', 'SCSI', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', bionic_disk01]

      if ARGV[0] == "up" && ! File.exist?(bionic_disk01)
        bionic.vm.provision "shell", path: "createPartitions.sh"
      end
    end
  end

  config.vm.define "cosmic" do |cosmic|
    cosmic.vm.box = "ubuntu/cosmic64"
    cosmic.ssh.insert_key = true
    cosmic.vm.network "private_network", ip: "10.7.8.47"
    cosmic.vm.hostname = "cosmic"

    config.vm.provider "virtualbox" do |disk01|
      cosmic_disk01 = '/tmp/cosmic_disk01.vdi'
      if not File.exists?(cosmic_disk01)
        disk01.customize ['createhd', '--filename', cosmic_disk01, '--variant', 'Standard', '--size', 5 * 1024]
      end
      disk01.customize ['storageattach', :id, '--storagectl', 'SCSI', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', cosmic_disk01]

      if ARGV[0] == "up" && ! File.exist?(cosmic_disk01)
        cosmic.vm.provision "shell", path: "createPartitions.sh"
      end
    end
  end

  config.vm.define "standard" do |standard|
    standard.vm.box = "ubuntu/bionic64"
    standard.ssh.insert_key = true
    standard.vm.network "private_network", ip: "10.7.8.49"
    standard.vm.hostname = "standard"

    config.vm.provider "virtualbox" do |disk01|
      standard_disk01 = '/tmp/standard_disk01.vdi'
      if not File.exists?(standard_disk01)
        disk01.customize ['createhd', '--filename', standard_disk01, '--variant', 'Standard', '--size', 5 * 1024]
      end
      disk01.customize ['storageattach', :id, '--storagectl', 'SCSI', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', standard_disk01]

      if ARGV[0] == "up" && ! File.exist?(standard_disk01)
        standard.vm.provision "shell", path: "createPartitions.sh"
      end
    end
  end

  config.vm.define "disco" do |disco|
    disco.vm.box = "ubuntu/disco64"
    disco.ssh.insert_key = true
    disco.vm.network "private_network", ip: "10.7.8.51"
    disco.vm.hostname = "disco"

    config.vm.provider "virtualbox" do |disk01|
      disco_disk01 = '/tmp/disco_disk01.vdi'
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
