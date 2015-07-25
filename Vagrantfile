Vagrant.configure(2) do |config|
  config.vm.box      = "ubuntu/trusty64"
  config.vm.hostname = "work"

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end

  unless ENV["WORK_SYNC_PATH"].nil?
    config.vm.synced_folder ENV["WORK_SYNC_PATH"], "/home/vagrant/work", type: :nfs
  end

  config.vm.network "private_network", ip: "10.10.10.23"

  config.vm.network "forwarded_port", guest: 5432,  host: 5432  # postgresql
  config.vm.network "forwarded_port", guest: 27017, host: 27017 # mongo
  config.vm.network "forwarded_port", guest: 6379,  host: 6379  # redis
  config.vm.network "forwarded_port", guest: 2181,  host: 2181  # zookeeper
  config.vm.network "forwarded_port", guest: 9092,  host: 9092  # kafka

  config.ssh.forward_agent = true

  config.vm.provision :ansible do |ansible|
    ansible.sudo     = true
    ansible.verbose  = "v"
    ansible.playbook = "playbooks/vagrant.yml"
    ansible.groups   = { "vagrant" => ["default"] }
  end
end
