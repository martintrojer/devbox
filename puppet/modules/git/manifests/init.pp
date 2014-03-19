class git {
  apt::ppa { 'ppa:git-core/ppa': }
  ->
  package { 'git':
    ensure => present }
}
