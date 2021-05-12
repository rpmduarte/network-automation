# Create Backend Service
resource "google_compute_backend_service" "BACKEND_SERVICE" {
  count              = length(var.regions)
  name               = "backend-service"
  port_name          = "http"
  health_checks      = [ google_compute_health_check.HTTP_CHECK_1.id ]
  backend {
    group            = "projects/${var.project_id}/zones/${var.regions[count.index]}-${local.zones_list[0]}/instanceGroups/unmanaged-${var.regions[count.index]}"
  }
  protocol           = "HTTP"
  session_affinity   = var.affinity_type
  custom_request_headers   = [ "X-Forwarded-Proto: https", "X-Client-Region: {client_region}" ]
  custom_response_headers  = [ "X-Cache-Hit: {cdn_cache_status}" ]
  provider           = google-beta
}
