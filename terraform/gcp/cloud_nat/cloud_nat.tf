
# Allocate external Static IP for cloud NAT
resource "google_compute_address" "CLOUD_NAT_EXTERNAL_ADDRESS" {
  count                              = length(var.regions)
  name                               = "cloudnat-${var.vpc_network_name}-${var.regions[count.index]}"
  region                             = var.regions[count.index]
  project                            = var.project_id
}

# Create Cloud NAT
resource "google_compute_router_nat" "CLOUD_NAT" {
  count                              = length(var.regions)
  name                               = "cloudnat-${var.vpc_network_name}-${var.regions[count.index]}"
  router                             = google_compute_router.CLOUD_ROUTER[count.index].name
  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips                            = [ google_compute_address.CLOUD_NAT_EXTERNAL_ADDRESS[count.index].self_link ]
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  region                             = var.regions[count.index]
  project                            = var.project_id
}
