# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
#  config.vm.box = "dummy" # AWS
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.ssh.forward_agent = true

  # ElasticSearch
  config.vm.network :forwarded_port, guest: 9200, host: 9200
  # ZooKeeper
  config.vm.network :forwarded_port, guest: 2181, host: 2181

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.manifest_file = "site.pp"
  end

# VirtualBox

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
  end

# AWS

  config.vm.provider :aws do |aws, override|
    aws.access_key_id = "XXXXXXXXXXXXXXXXXXXX"
    aws.secret_access_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    aws.ami = "ami-e7582d8e"  # Ubuntu 12.04 amd64 EBS
    aws.instance_type = "m1.large"
    aws.keypair_name = "### INSERT AWS KEYPAIR NAME"
    aws.region = "us-east-1"
    aws.security_groups = ["### INSERT GROUP NAME"] # must be group name, not ID
    aws.tags = {
      "Name" => "### INSERT NAME FOR PAIRHOST INSTANCE",
      "Owner" => "### INSERT YOUR NAME HERE"
    }
    override.ssh.username = "ubuntu"
    override.ssh.private_key_path = "###INSERT PATH TO PRIVATE KEY"
  end

end
