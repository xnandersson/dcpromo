class dc::samba {

  $realm = hiera('realm','SAMDOM.SAMBA.ORG')
  $domain = hiera('domain','SAMDOM')
  $netbios_name = hiera('netbios_name','SAMDOM')

  package { 'samba':
    ensure => installed,
  }

  file { '/etc/samba/smb.conf':
    ensure => present,
    owner => 'root',
    group => 'root',
    mode => '644',
    content => template('dc/smb.conf.erb'),
    require => Package['samba'],
  }

}
