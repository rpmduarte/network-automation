
# Create instance
resource "google_compute_instance_from_template" "INSTANCE" {
  count                        = length(var.regions)
  name                         = "${var.network_name}-${var.regions[count.index]}"
  #source_instance_template    = google_compute_instance_template.F1_MICRO_DEBIAN.id
  source_instance_template     = local.instance_template_name
  zone                         = "${var.regions[count.index]}-${local.zones_list[0]}"
  network_interface {
    subnetwork                 = "${var.vpc_network_name}-${var.regions[count.index]}"
    #subnetwork                = "https://www.googleapis.com/compute/v1/projects/${local.project_name}/regions/${local.region_name}/subnetworks/${local.network_na>
    #subnetwork                 = google_compute_subnetwork.SUBNET[count.index].name
    #subnetwork                 = module.networking.subnet_id
    access_config {}
  }
  connection {
    host                       = network_interface.0.access_config.0.nat_ip
  }
  tags                         = var.instance_network_tags
}

