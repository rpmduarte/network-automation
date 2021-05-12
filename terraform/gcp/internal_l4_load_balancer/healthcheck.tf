# Create healthcheck
resource "google_compute_health_check" "HEALTH_CHECK" {
  name                = var.healthcheck_name
  check_interval_sec  = var.healthcheck_interval
  timeout_sec         = var.healthcheck_timeout
  tcp_health_check {
    port = var.backend_port
  }
  provider            = google-beta
}
