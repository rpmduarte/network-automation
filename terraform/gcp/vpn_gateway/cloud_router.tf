# Create Cloud Router
resource "google_compute_router" "CLOUD_ROUTER" {
  name                          = local.cloud_router_name
  region                        = var.region         
  network                       = var.vpc_network_name
  bgp {
    asn                         = var.cloud_router_bgp_asn
  }
}

