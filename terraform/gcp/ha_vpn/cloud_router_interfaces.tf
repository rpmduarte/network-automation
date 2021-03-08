# Create Cloud Router Point-to-Point Interfaces to use for Routing 
resource "google_compute_router_interface" "ROUTER_INTERFACE_0" {
  name                            = "${var.region}-${var.peer_gateway_name}-int-0"
  region                          = var.region
  ip_range                        = var.peer_0_local_ip
  router                          = var.cloud_router_name
  vpn_tunnel                      = google_compute_vpn_tunnel.VPN_TUN_0.id
}
resource "google_compute_router_interface" "ROUTER_INTERFACE_1" {
  name                            = "${var.region}-${var.peer_gateway_name}-int-1"
  region                          = var.region
  ip_range                        = var.peer_1_local_ip
  router                          = var.cloud_router_name
  vpn_tunnel                      = google_compute_vpn_tunnel.VPN_TUN_1.id
}

