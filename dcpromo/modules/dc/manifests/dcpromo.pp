class dc::dcpromo {

  $domain = hiera('domain','samdom')
  $host_name = hiera('host_name','DC')

  $realm = hiera('realm','SAMDOM.SAMBA.ORG')
  $kerberos_servers = hiera('kerberos_servers','DC.samdom.samba.org')
  $admin_server = hiera('admin_server','DC.samdom.samba.org')

  $password = hiera('password','Secret007!')
  $adminpass = hiera('adminpass',$password)
  $dnspass = hiera('dnspass',$password)
  $krbtgtpass = hiera('krbtgtpass',$password)
  $machinepass = hiera('machinepass',$password)

  $server_role = hiera('server_role','dc')
  $dns_backend = hiera('dns_backend','BIND9_DLZ')

  $root = hiera('root','root')
  $nobody = hiera('nobody','nobody')
  $users = hiera('users','staff')

  $use_rfc2307 = hiera('use_rfc2307','yes')

  file { '/etc/dcpromo':
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode => '0755',
  }

  file { '/etc/dcpromo/dcpromo':
    owner => 'root',
    group => 'root',
    mode => '770',
    content => template('dc/dcpromo.erb'),
    require => File['/etc/dcpromo'],
  }

  exec { 'dcpromo':
    command => '/etc/dcpromo/dcpromo > /etc/dcpromo/dcpromo.log',
    creates => '/etc/dcpromo/dcpromo.log',
    require => [File['/etc/dcpromo'],Class['dc::samba']],
  }

}
