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
  }

  file { '/etc/bind/named.conf.samba':
    owner => 'root',
    group => 'bind',
    mode => '644',
    ensure => present,
    content => template('dc/named.conf.samba.erb'),
  }

  file { '/etc/bind/named.conf.options':
    owner => 'root',
    group => 'bind',
    mode => '644',
    ensure => present,
    content => template('dc/named.conf.options.erb'),
  }

  file { '/var/lib/samba/private/dns.keytab':
    ensure => present,
    replace => false,
    group => 'bind',
    mode => '640',
    require => Class['dc::dcpromo'],
  }

}
