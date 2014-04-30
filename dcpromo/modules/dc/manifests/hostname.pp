class dc::hostname {

  $host_name = hiera('host_name','dc')

  file { '/etc/hostname':
    ensure => present,
    owner => 'root',
    group => 'root',
    mode => 644,
    content => template("dc/hostname.erb"),
  }

  exec { 'hostname':
    command => '/bin/hostname --file /etc/hostname',
    require => File['/etc/hostname'],
  }

}

