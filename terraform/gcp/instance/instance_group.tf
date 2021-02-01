
# Create Instance Group for each instance
resource "google_compute_instance_group" "INSTANCE_GROUP" {
  count                        = length(var.region_names)
  name                         = "unmanaged-instance-group-${var.region_names[count.index]}"
  zone                         = "${var.region_names[count.index]}-${local.zones_list[0]}"
  #network                      = google_compute_network.NETWORK.self_link
  network                      = "https://www.googleapis.com/compute/v1/projects/${var.project_name}/global/networks/${var.network_name}"
  instances                    = [ google_compute_instance_from_template.INSTANCE[count.index].id ]
}

