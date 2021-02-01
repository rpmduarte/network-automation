#data "google_compute_network" "NETWORK" {
#  name                                 = var.network_name
#  auto_create_subnetworks              = false
#}
#data "google_compute_subnetwork" "SUBNET" {
#  count                                = length(var.region_names)
#  name                                 = "${var.network_name}-${var.region_names[count.index]}"
#}

resource "google_compute_network" "NETWORK" {
  name                                 = var.network_name
  auto_create_subnetworks              = false
}
resource "google_compute_subnetwork" "SUBNET" {
  count                                = length(var.region_names)
  name                                 = "${var.network_name}-${var.region_names[count.index]}"
  region                               = var.region_names[count.index]
  ip_cidr_range                        = var.network_cidrs[count.index]
  network                             = google_compute_network.NETWORK.id
  #network                              = var.network_name
  private_ip_google_access             = true
  log_config {
    aggregation_interval               = "INTERVAL_1_MIN"
    flow_sampling                      = 1.0
    metadata                           = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_router" "CLOUD_ROUTER" {
  count                                = length(var.region_names)
  name                                 = "cloud-router-${google_compute_subnetwork.SUBNET[count.index].region}"
  region                               = google_compute_subnetwork.SUBNET[count.index].region
  network                              = google_compute_network.NETWORK.self_link
  #network                              = var.network_name
  bgp {
    asn                                = 64514
  }
}

#resource "google_compute_address" "CLOUD_NAT_ADDRESS" {
#  count                                = length(local.region_names)
#  name                                 = "cloudnat-${google_compute_subnetwork.SUBNET[count.index].region}"
#  region                               = google_compute_subnetwork.SUBNET[count.index].region
#}

#resource "google_compute_router_nat" "CLOUD_NAT" {
#  count                                = length(local.region_names)
#  name                                 = "cloudnat-${google_compute_subnetwork.SUBNET[count.index].region}"
#  router                               = google_compute_router.CLOUD_ROUTER[count.index].name
#  region                               = google_compute_subnetwork.SUBNET[count.index].region
#  nat_ip_allocate_option               = "MANUAL_ONLY"
#  nat_ips                              = [ google_compute_address.CLOUD_NAT_ADDRESS[count.index].self_link ]
#  source_subnetwork_ip_ranges_to_nat   = "ALL_SUBNETWORKS_ALL_IP_RANGES"
#}
