resource "random_integer" "PEER0_THIRD_OCTET" {
  min = 2
  max = 255
}
resource "random_integer" "PEER0_FOURTH_OCTET_BASE" {
  min = 0
  max = 63
}
resource "random_integer" "PEER1_THIRD_OCTET" {
  min = 2
  max = 255
}
resource "random_integer" "PEER1_FOURTH_OCTET_BASE" {
  min = 0
  max = 63
}

locals {
  peer0_third_octet  = random_integer.PEER0_THIRD_OCTET.result
  peer0_gcp_ip       = random_integer.PEER0_FOURTH_OCTET_BASE.result * 4 + 1
  peer0_bgp_ip       = random_integer.PEER0_FOURTH_OCTET_BASE.result * 4 + 2
  peer1_third_octet  = random_integer.PEER1_THIRD.result
  peer1_gcp_ip       = random_integer.PEER1_FOURTH_OCTET_BASE.result * 4 + 1
  peer1_bgp_ip       = random_integer.PEER1_FOURTH_OCTET_BASE.result * 4 + 2
}
