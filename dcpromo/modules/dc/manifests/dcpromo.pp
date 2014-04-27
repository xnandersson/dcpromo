class dc::dcpromo {

  $dc = hiera('dc')
  $password = $dc['password']
  $domain = $dc['domain']
  $host_name = $dc['host_name']

  # Realm: OPENFORCE.ORG
  # Domain: OPENFORCE
  # Server Role: dc
  # DNS: BIND9_DLZ
  #
  # Options: samba-tool domain provision --help
  #

  exec { 'dcpromo':
    command => "/usr/bin/samba-tool domain provision --domain=$domain --host-name=$host_name --adminpass=$password --krbtgtpass=$password --machinepass=$password --dnspass=$password --root=root --nobody=nobody --users=staff --server-role=dc --use-rfc2307 --realm=$realm --dns-backend=BIND9_DLZ",
    require => Class['dc::samba'],
  }

}
