# Clojure muti-user devbox

* Using Vagrant and puppet
* JVM, Emacs, Lein
* Elasticsearch running as a service
* Stubs for AWS

## Setting up

1. git submodule init
2. git submodule update
3. vagrant up

## Adding a user

* puppet/modules/users/manifests/init.pp
* puppet/modules/users/files/...
* puppet/modules/wemux/templates/usr/local/etc/wemux.conf.erb

## Connecting

* vagrant ssh (not ideal, not the correct user)

1. ssh-add ~/.ssh/id_rsa
2. ssh -A jon@localhost -p 2222

## Pairing

wemux

### Misc

* ssh_key is ~/.ssh/id_rsa.pub
* password_hash is created with 'passwd ...'
