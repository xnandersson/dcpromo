class dc::bind9 {

  package { 'bind9':
    ensure => installed,
  }

  file { '/etc/bind/named.conf':
    owner => 'root',
    group => 'bind',
    mode => '644',
    ensure => present,
    content => template('dc/named.conf.erb'),
    require => Package['bind9'],
  }

  file { '/etc/bind/named.conf.samba':
    owner => 'root',
    group => 'bind',
    mode => '644',
    ensure => present,
    content => template('dc/named.conf.samba.erb'),
    require => Package['bind9'],
  }

  file { '/etc/bind/named.conf.options':
    owner => 'root',
    group => 'bind',
    mode => '644',
    ensure => present,
    content => template('dc/named.conf.options.erb'),
    require => Package['bind9'],
  }

  file { '/var/lib/samba/private/dns.keytab':
    ensure => present,
    replace => false,
    group => 'bind',
    mode => '640',
    require => Class['dc::dcpromo'],
  }

  file { '/etc/apparmor.d/usr.sbin.named':
    ensure => present,
    owner => 'root',
    group => 'root',
    mode => '644',
    source => 'puppet:///modules/dc/usr.sbin.named',
    require => Package['bind9'],
    notify => Service['apparmor'],
  }

  service { 'apparmor':
    name => 'apparmor',
    hasrestart => true,
  }

}
