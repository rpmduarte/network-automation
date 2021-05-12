
# HTTP URL Map (just redirects to HTTPS)
resource "google_compute_url_map" "URL_MAP_HTTP" {
  name               = "urlmap-http"
  default_service    = google_compute_backend_bucket.BACKEND_BUCKET.id
  depends_on         = [ google_compute_backend_bucket.BACKEND_BUCKET ]
  host_rule {
    hosts            = ["*"]
    path_matcher     = "all-hosts"
  }
  path_matcher {
    name             = "all-hosts"
    default_url_redirect {
      https_redirect = true
      strip_query    = false
    }
  }
  provider           = google-beta
}
resource "google_compute_url_map" "URL_MAP_HTTPS" {
  count                 = length(var.regions)
  name                  = "urlmap-https"
  default_service       = google_compute_backend_service.BACKEND_SERVICE[count.index].id
}

# Target proxies
resource "google_compute_target_http_proxy" "TPROXY_HTTP" {
  name                  = "target-proxy-http"
  url_map               = google_compute_url_map.URL_MAP_HTTP.id
}
resource "google_compute_target_https_proxy" "TPROXY_HTTPS" {
  count                 = length(var.regions)
  name                  = "target-proxy-https"
  url_map               = google_compute_url_map.URL_MAP_HTTPS[count.index].id
  ssl_certificates      = [ 
    for cert in google_compute_ssl_certificate.SSL_CERT:
      cert.id
  ]
  quic_override         = "NONE"
  ssl_policy            = var.ssl_policy
}

# Create HTTP & HTTPS forwarding rules (frontends)
resource "google_compute_global_forwarding_rule" "FWD_RULE_HTTP" {
  name                  = "frontend-http"
  ip_address            = google_compute_global_address.EXTERNAL_L7LB_IP_ADDRESS.address
  port_range            = "80"
  target                = google_compute_target_http_proxy.TPROXY_HTTP.id
}
resource "google_compute_global_forwarding_rule" "FWD_RULE_HTTPS" {
  count                 = length(var.regions)
  name                  = "frontend-https"
  ip_address            = google_compute_global_address.EXTERNAL_L7LB_IP_ADDRESS.address
  port_range            = "443"
  target                = google_compute_target_https_proxy.TPROXY_HTTPS[count.index].id
}
