
# Create Cloud Router Point-to-Point Interfaces to use for Routing 
resource "google_compute_router_interface" "ROUTER_INTERFACE0" {
  name          = "${var.region}-${var.peer_gateway_name}-int0"
  region        = var.region
  #ip_range     = var.peer0_local_ip
  ip_range      = "${local.vpn_tun0_bgp_ip}/30"
  router        = var.cloud_router_name
  vpn_tunnel    = google_compute_vpn_tunnel.VPN_TUN0.id
}
resource "google_compute_router_interface" "ROUTER_INTERFACE1" {
  name          = "${var.region}-${var.peer_gateway_name}-int1"
  region        = var.region
  #ip_range                        = var.peer1_local_ip
  ip_range      = "${local.vpn_tun1_bgp_ip}/30"
  router        = var.cloud_router_name
  vpn_tunnel    = google_compute_vpn_tunnel.VPN_TUN1.id
}

