resource "google_compute_external_vpn_gateway" "EXTERNAL_VPN_GATEWAY" {
  name              = var.peer_gateway_name
  description       = var.peer_gateway_description
  redundancy_type   = "TWO_IPS_REDUNDANCY"
  interface {
    id              = 0
    ip_address      = var.peer0_public_ip
  }
  interface {
    id              = 1
    ip_address      = var.peer1_public_ip
  }
  provider          = google-beta
}

