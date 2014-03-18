class emacs {
  apt::ppa { 'ppa:cassou/emacs':
    before => [ Package['emacs24-nox'], Package['emacs24-el'], Package['emacs24-common-non-dfsg'] ]
  }

  package { 'emacs24-nox' : ensure => present }
  package { 'emacs24-el' : ensure => present }
  package { 'emacs24-common-non-dfsg' : ensure => present }

}
