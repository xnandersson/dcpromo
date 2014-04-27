class dc::wireshark {

  package { ['tshark','tcpdump','nmap']:
    ensure => installed,
  }

}
