class dc {
  include dc::bind9
  #include dc::hostname
  include dc::samba
  include dc::kerberos
  include dc::dcpromo
  #include dc::wireshark
}
