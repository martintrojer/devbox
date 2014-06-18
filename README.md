# Clojure muti-user devbox

* Using Vagrant and puppet
* JVM, Emacs, Lein
* PostreSQL
* Stubs for AWS

## Setting up

1. git submodule init
2. git submodule update
3. vagrant box add trusty64 https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box -- you only need to do this once!
4. vagrant up

## Adding a user

Edit these files;

* puppet/modules/users/manifests/init.pp
* puppet/modules/users/files/...
* puppet/modules/wemux/templates/usr/local/etc/wemux.conf.erb

### users/manifests/init.pp

* ssh_key is ~/.ssh/id_rsa.pub
* password_hash is created with 'passwd ...'

## Connecting

* vagrant ssh (not ideal, not the correct user)

1. ssh-add ~/.ssh/id_rsa
2. ssh -A jon@localhost -p 2222

## Pairing

wemux
