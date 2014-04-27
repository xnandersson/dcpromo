class dc::samba {

  $dc = hiera('dc')
  $realm = $dc['realm']
  $domain = $dc['domain']
  $netbios_name = $dc['netbios_name']

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
