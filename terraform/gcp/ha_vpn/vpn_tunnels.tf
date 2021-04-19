
# Create random 20-character long strings to use for pre-shared keys
resource "random_password" "PEER0_PSK" {
  length           = 20
  special          = false
}
resource "random_password" "PEER1_PSK" {
  length           = 20
  special          = false
}

# Create VPN Tunnels
resource "google_compute_vpn_tunnel" "VPN_TUN0" {
  name                            = var.peer0_vpn_name
  vpn_gateway                     = var.vpn_gateway_name
  peer_external_gateway           = var.peer_gateway_name
  depends_on                      = [ google_compute_external_vpn_gateway.EXTERNAL_VPN_GATEWAY ]
  #shared_secret                   = var.peer0_psk
  shared_secret                   = random_password.PEER0_PSK.result
  router                          = var.cloud_router_name
  peer_external_gateway_interface = 0
  vpn_gateway_interface           = 0
  region                          = var.region
  provider                        = google-beta
}
resource "google_compute_vpn_tunnel" "VPN_TUN1" {
  name                            = var.peer1_vpn_name
  vpn_gateway                     = var.vpn_gateway_name
  peer_external_gateway           = var.peer_gateway_name
  depends_on                      = [ google_compute_external_vpn_gateway.EXTERNAL_VPN_GATEWAY ]
  #shared_secret                   = var.peer1_psk
  shared_secret                   = random_password.PEER1_PSK.result
  router                          = var.cloud_router_name
  peer_external_gateway_interface = 1
  vpn_gateway_interface           = 1
  region                          = var.region
  provider                        = google-beta
}

