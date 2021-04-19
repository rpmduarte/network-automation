resource "random_integer" "THIRD_OCTET_0" {
  min = 2
  max = 255
}
resource "random_integer" "THIRD_OCTET_1" {
  min = 2
  max = 255
}
resource "random_integer" "FOURTH_OCTET_BASE_0" {
  min = 0
  max = 63
}
resource "random_integer" "FOURTH_OCTET_BASE_1" {
  min = 0
  max = 63
}

locals {
  vpn_tun0_thirdoctet    = random_integer.THIRD_OCTET_0.result
  vpn_tun0_bgp_ip        = random_integer.FOURTH_OCTET_BASE_0.result * 4 + 1
  peer0_bgp_ip           = random_integer.FOURTH_OCTET_BASE_0.result * 4 + 2
  vpn_tun1_thirdoctet    = random_integer.THIRD_OCTET_1.result
  vpn_tun1_bgp_ip        = random_integer.FOURTH_OCTET_BASE_1.result * 4 + 1
  peer1_bgp_ip           = random_integer.FOURTH_OCTET_BASE_1.result * 4 + 2
}
