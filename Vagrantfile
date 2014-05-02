# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # config.vm.box = "dummy" # AWS
  config.vm.box = "trusty64"
  # vagrant box add trusty64 https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box

  config.ssh.forward_agent = true

  config.vm.network :forwarded_port, guest: 8080, host: 8080

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
