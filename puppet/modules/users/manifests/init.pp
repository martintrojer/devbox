define user_with_home ( $password_hash, $ssh_key="",) {

  user { $title:
    ensure   => present,
    home     => "/home/$title",
    password => $password_hash,
    groups   => ["users"],
    shell    => "/bin/bash",
    managehome  => true,
  }

  sudo::sudoer { $title: }

  if ( $ssh_key != "" ) {
    ssh_authorized_key { $title:
      ensure      => present,
      type        => "ssh-rsa",
      key         => $ssh_key,
      user        => $title,
    }
  }

  file { "/home/$title/.ssh/":
    ensure => directory,
    owner  => $title,
    mode   => 0700
  }
}

define work_repos {
  ## TODO
  # check out the work repos in the user home folder
}

class users::martin {

  user_with_home { "martin":
    password_hash => "FillMeIn",
    ssh_key => "FillMeIn",
  }

  file { "bootstrap":
    name => "/home/martin/bootstrap.sh",
    ensure => present,
    owner => "martin",
    mode => 755,
    source => "puppet:///modules/users/martin/bootstrap.sh",
  }
}

class users {

  require martin

}
