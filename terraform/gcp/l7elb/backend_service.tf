# Create Healthchecks
resource "google_compute_health_check" "HEALTHCHECK_TCP_80" {
  name               = "tcp-80"
  tcp_health_check {
    port             = 80
  }
  check_interval_sec = 60
  timeout_sec        = 2
}

# Create named Ports
resource "google_compute_instance_group_named_port" "NAMED_PORT_APACHE" {
  #group              = google_compute_instance_group.INSTANCE_GROUP.id
  group              = local.instance_group_name
  zone               = local.backend_zone
  name               = "port-80-http"
  port               = 80
  provider           = google-beta
}

# Create Backend Service
resource "google_compute_backend_service" "BACKEND_SERVICE" {
  name               = "backend-service"
  port_name          = "http"
  health_checks      = [ google_compute_health_check.HEALTHCHECK_TCP_80.id ]
  backend {
    #group            = google_compute_instance_group.INSTANCE_GROUP[0].self_link
    group            = "https://www.googleapis.com/compute/v1/projects/${var.project_name}/zones/${local.backend_zone}/instanceGroups/${local.instance_group_name}"
    balancing_mode   = "UTILIZATION"
    max_utilization  = 1.0
  }
  protocol           = "HTTP"
  session_affinity   = "CLIENT_IP"
  custom_request_headers   = [ "X-Forwarded-Proto: https", "X-Client-Region: {client_region}" ]
  custom_response_headers  = [ "X-Cache-Hit: {cdn_cache_status}" ]
  provider           = google-beta
}
