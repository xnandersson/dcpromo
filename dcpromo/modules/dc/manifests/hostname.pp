class dc::hostname {

  $host_name = hiera('host_name','dc')

  file { '/etc/hostname':
    ensure => present,
    owner => 'root',
    group => 'root',
    mode => 644,
    content => "$host_name",
  }

}

