class dc::kerberos {

  $default_realm = hiera('default_realm','SAMDOM.SAMBA.ORG')
  $kerberos_servers = hiera('kerberos_servers','DC.samdom.samba.org')
  $admin_server = hiera('admin_server','DC.samdom.samba.org')

  package { 'krb5-user':
    ensure => installed,
    require => Exec['krb5-user.debconf'],
  }

  exec { 'krb5-user.debconf':
    command => '/usr/bin/debconf-set-selections /tmp/krb5-user.debconf',
    require => File['/tmp/krb5-user.debconf'],
  }

  file { '/tmp/krb5-user.debconf':
    content => template('dc/krb5-user.debconf.erb'),
  }

  file { '/etc/krb5.conf':
    content => template('dc/krb5.conf.erb'),
  }

}
