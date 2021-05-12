# Create Cloud Router
resource "google_compute_router" "CLOUD_ROUTER" {
  count                         = length(var.regions)
  name                          = "cloudrouter-${var.vpc_network_name}-${var.regions[count.index]}"
  network                       = var.vpc_network_name
  region                        = var.regions[count.index]
  project                       = var.project_id
}

