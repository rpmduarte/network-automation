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

# Create Cloud Router Point-to-Point Interfaces to use for Routing 
resource "google_compute_router_interface" "ROUTER_INTERFACE0" {
  name          = "${var.region}-${var.peer_gateway_name}-int0"
  region        = var.region
  #ip_range     = var.peer0_local_ip
  ip_range      = "169.254.${third_octet_0}.${fourth_octet_0}"
  router        = var.cloud_router_name
  vpn_tunnel    = google_compute_vpn_tunnel.VPN_TUN0.id
}
resource "google_compute_router_interface" "ROUTER_INTERFACE1" {
  name          = "${var.region}-${var.peer_gateway_name}-int1"
  region        = var.region
  #ip_range                        = var.peer1_local_ip
  ip_range      = "169.254.${third_octet_1}.${fourth_octet_1}"
  router        = var.cloud_router_name
  vpn_tunnel    = google_compute_vpn_tunnel.VPN_TUN1.id
}

locals {
  third_octet_0   = random_integer.THIRD_OCTET_0.result
  fourth_octet_0  = random_integer.FOURTH_OCTET_BASE_0.result * 4 + 1
  third_octet_1   = random_integer.THIRD_OCTET_1.result
  fourth_octet_1  = random_integer.FOURTH_OCTET_BASE_1.result * 4 + 1
}
