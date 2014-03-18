class sudo {

	package { 'sudo': ensure => installed }

	# file { '/etc/sudoers':
	# 	source => 'puppet:///modules/sudo/etc/sudoers',
  #   group => "root",
	# 	mode => 0440,
	# 	require => Package['sudo'],
	# }

	define sudoer($nopasswd = false) {
		include sudo
		$sudoers_line = $nopasswd ? {
					true => "$name ALL=(ALL) NOPASSWD: ALL",
					false => "$name ALL=(ALL) ALL",
				}

		file { "/etc/sudoers.d/$name":
			content => $sudoers_line,
			mode => 0440,
			require => Package['sudo'],
		}
	}

}
