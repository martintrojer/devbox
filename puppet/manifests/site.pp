import 'puppetlabs-stdlib'
class { 'apt': always_apt_update => true }

include leiningen
include users
include wemux

package { 'postgresql-9.3' : ensure => present }

package { 'git' : ensure => present }
package { ['emacs24-nox', 'emacs24-el', 'emacs24-common-non-dfsg'] : ensure => present }
package { ['curl', 'tmux', 'unzip', 'silversearcher-ag', 'tree', 'htop'] : ensure => present }
