# Backend Service
resource "google_compute_region_backend_service" "BACKEND_SERVICE" {
  count              = length(var.regions)
  name               = "${var.regions[count.index]}-${var.backend_port}"
  region              = var.regions[count.index]
  backend {
    #group            = google_compute_instance_group.INSTANCE_GROUP[count.index].self_link
    #group            = "unmanaged-${var.regions[count.index]}"
    group            = "projects/${var.project_id}/zones/${var.regions[count.index]}-${local.zones_list[0]}/instanceGroups/unmanaged-${var.regions[count.index]}"
  }
  health_checks      = [ google_compute_health_check.HEALTH_CHECK.id ]
  protocol           = "TCP"
  session_affinity   = var.affinity_type
  provider           = google-beta
}

