class wemux {
  vcsrepo { "/usr/local/share/wemux":
    ensure   => latest,
    source   => "https://github.com/zolrath/wemux.git",
    provider => git,
  }

  file { "/usr/local/bin/wemux":
    ensure => 'symlink',
    target => '/usr/local/share/wemux/wemux'
  }

  file { "/usr/local/etc/wemux.conf":
    content => template('wemux/usr/local/etc/wemux.conf.erb')
  }
}
