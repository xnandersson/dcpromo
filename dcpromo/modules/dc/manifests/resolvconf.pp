class dc::resolvconf {

  $dnsdomainname = hiera('dnsdomainname') 

  # set /files/etc/network/interfaces/iface[2]/dns-nameservers '127.0.0.1'
  # set /files/etc/network/interfaces/iface[2]/dns-search = 127.0.0.1
  #

  #augeas { 'interfaces':
  #  context => '/files/etc/network/interfaces',
  #  changes => [
  #    "set iface[2]/dns-nameservers 127.0.0.1",
  #    "set iface[2]/dns-search $dnsdomainname",
  #  ],
  #}

  file { '/etc/resolv.conf':
    content => template('dc/resolv.conf.erb'),
  }

  file { '/etc/dhcp/dhclient.conf':
    content => template('dc/dhclient.conf.vagrant.erb'),
  }

}
