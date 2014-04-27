class dc::resolvconf {

  $dc = hiera('dc')
  $domain = $dc['domain']

  # set /files/etc/network/interfaces/iface[2]/dns-nameservers '127.0.0.1'
  # set /files/etc/network/interfaces/iface[2]/dns-search = 127.0.0.1
  #

  augeas { 'interfaces':
    context => '/files/etc/network/interfaces',
    changes => [
      "set iface[2]/dns-nameservers 127.0.0.1",
      "set iface[2]/dns-search $domain",
    ],
  }

  file { '/etc/resolv.conf':
    content => template('dc/resolv.conf.erb'),
  }

}