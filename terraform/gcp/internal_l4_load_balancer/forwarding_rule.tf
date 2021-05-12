
# Forwarding Rule (aka Frontend)
resource "google_compute_forwarding_rule" "FRONTEND" {
  count                = length(var.regions)
  name                  = "${var.regions[count.index]}-${var.frontend_port}"
  region                = var.regions[count.index]
  load_balancing_scheme = "INTERNAL"
  backend_service       = google_compute_region_backend_service.BACKEND_SERVICE[count.index].self_link
  all_ports             = false
  ip_protocol           = "TCP"
  ports                 = [ var.backend_port ]
  allow_global_access   = var.allow_global_access
  network               = var.vpc_network_name
  subnetwork            = "${var.vpc_network_name}-${var.regions[count.index]}"
  provider              = google-beta
}

