class leiningen {
  package { 'openjdk-7-jdk' : ensure => present }

  exec { 'lein' :
    command => '/usr/bin/wget -O /usr/bin/lein https://raw.github.com/technomancy/leiningen/stable/bin/lein',
    creates => '/usr/bin/lein',
  }

  file { 'lein chmod' :
    path => '/usr/bin/lein',
    ensure => present,
    mode => 0755,
    owner => root,
    require => Exec['lein'],
  }
}
