# Create Healthchecks
resource "google_compute_health_check" "HTTP_CHECK_1" {
  name               = var.http_check1_name
  https_health_check {
    port             = var.http_check1_port
    request_path     = var.http_check1_path
  }
  check_interval_sec = var.healthcheck_interval
  timeout_sec        = var.healthcheck_timeout
}
resource "google_compute_health_check" "HTTP_CHECK_2" {
  name               = var.http_check2_name
  https_health_check {
    port             = var.http_check2_port
    request_path     = var.http_check2_path
  }
  check_interval_sec = var.healthcheck_interval
  timeout_sec        = var.healthcheck_timeout
}

