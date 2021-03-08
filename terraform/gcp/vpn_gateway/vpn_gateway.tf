# Create Cloud VPN Gateway
resource "google_compute_ha_vpn_gateway" "VPN_GATEWAY" {
  name                         = local.vpn_gateway_name
  network                      = var.network_name
  region                       = var.region
  provider                     = google-beta
}

