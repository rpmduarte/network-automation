# Create BGP Sessions
resource "google_compute_router_peer" "ROUTER_VPN_BGP0" {
  name                            = "${var.region}-${var.peer_gateway_name}-bgp0"
  router                          = var.cloud_router_name
  #peer_ip_address                 = var.peer0_remote_ip
  peer_ip_address                 = "169.254.${local.peer0_third_octet}.${local.peer0_bgp_ip}"
  peer_asn                        = var.peer0_bgp_asn
  advertised_route_priority       = var.peer0_adv_metric
  depends_on                      = [ google_compute_router_interface.ROUTER_INTERFACE0 ]
  interface                       = google_compute_router_interface.ROUTER_INTERFACE0.name
  advertise_mode                  = var.peer0_adv_mode
  advertised_ip_ranges { 
    range                         = var.peer0_adv_prefix
  }
  region                          = var.region
  provider                        = google-beta
}
resource "google_compute_router_peer" "ROUTER_VPN_BGP1" {
  name                            = "${var.region}-${var.peer_gateway_name}-bgp1"
  router                          = var.cloud_router_name
  #peer_ip_address                 = var.peer1_remote_ip
  peer_ip_address                 = "169.254.${local.peer1_third_octet}.${local.peer1_bgp_ip}"
  peer_asn                        = var.peer1_bgp_asn
  advertised_route_priority       = var.peer1_adv_metric
  depends_on                      = [ google_compute_router_interface.ROUTER_INTERFACE1 ]
  interface                       = google_compute_router_interface.ROUTER_INTERFACE1.name
  advertise_mode                  = var.peer1_adv_mode
  advertised_ip_ranges { 
    range                         = var.peer1_adv_prefix
  }
  region                          = var.region
  provider                        = google-beta
}

