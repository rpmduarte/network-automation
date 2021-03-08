# Create BGP Sessions
resource "google_compute_router_peer" "ROUTER_VPN_BGP_0" {
  name                            = "${var.region}-${var.peer_gateway_name}-bgp-0"
  router                          = var.cloud_router_name
  peer_ip_address                 = var.peer_0_remote_ip
  peer_asn                        = var.peer_0_bgp_asn
  advertised_route_priority       = var.peer_0_adv_metric
  interface                       = google_compute_router_interface.ROUTER_INTERFACE_0.name
  advertise_mode                  = "CUSTOM"
  advertised_ip_ranges { 
   range                          = var.adv_prefix_range
  }
  region                          = var.region
  provider                        = google-beta
}
resource "google_compute_router_peer" "ROUTER_VPN_BGP_1" {
  name                            = "${var.region}-${var.peer_gateway_name}-bgp-1"
  router                          = var.cloud_router_name
  peer_ip_address                 = var.peer_1_remote_ip
  peer_asn                        = var.peer_1_bgp_asn
  advertised_route_priority       = var.peer_1_adv_metric
  interface                       = google_compute_router_interface.ROUTER_INTERFACE_1.name
  advertise_mode                  = "CUSTOM"
  advertised_ip_ranges { 
    range                         = var.adv_prefix_range
  }
  region                          = var.region
  provider                        = google-beta
}

