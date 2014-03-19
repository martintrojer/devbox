# core modules
import 'puppetlabs-stdlib'
class { 'apt': }

# apt-get update
stage { 'preinstall': before => Stage['main'] }
class apt_get_update { exec { '/usr/bin/apt-get -y update': } }
class { 'apt_get_update': stage => preinstall }

include leiningen
include emacs
include users
include wemux
include git

class { 'elasticsearch':
  package_url => 'https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.0.1.deb'
}

package { 'curl' : ensure => present }
package { 'tmux' : ensure => present }
package { 'tree' : ensure => present }
package { 'htop' : ensure => present }
