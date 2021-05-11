
# Create Instance Group for each instance
resource "google_compute_instance_group" "INSTANCE_GROUP" {
  count                        = length(var.regions)
  name                         = "unmanaged-${var.regions[count.index]}"
  zone                         = "${var.regions[count.index]}-${local.zones_list[0]}"
  #network                      = google_compute_network.NETWORK.self_link
  network                      = "https://www.googleapis.com/compute/v1/projects/${var.project_name}/global/networks/${var.vpc_network_name}"
  instances                    = [ google_compute_instance_from_template.INSTANCE[count.index].id ]
}

