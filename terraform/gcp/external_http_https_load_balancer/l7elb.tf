# Reserve External Static IP Address
resource "google_compute_global_address" "EXTERNAL_L7LB_IP_ADDRESS" {
  name               = "l7lb"
}

resource "google_compute_url_map" "URL_MAP" {
  name               = "urlmap"
  #default_service    = google_compute_backend_service.BACKEND_SERVICE.id
  default_service    = google_compute_backend_bucket.BACKEND_BUCKET.id
}

resource "google_compute_target_http_proxy" "TPROXY_HTTP" {
  name                  = "target-proxy-http"
  url_map               = google_compute_url_map.URL_MAP.id
}

# Target proxies
resource "google_compute_target_https_proxy" "TPROXY_HTTPS" {
  name                  = "target-proxy-https"
  url_map               = google_compute_url_map.URL_MAP.id
  ssl_certificates      = [ 
    for cert in google_compute_ssl_certificate.SSL_CERT:
      cert.id
  ]
  quic_override         = "NONE"
  ssl_policy            = local.ssl_policy
}

# Create HTTP & HTTPS forwarding rules (frontends)
resource "google_compute_global_forwarding_rule" "FWD_RULE_HTTP" {
  name                  = "frontend-http"
  ip_address            = google_compute_global_address.EXTERNAL_L7LB_IP_ADDRESS.address
  port_range            = "80"
  target                = google_compute_target_http_proxy.TPROXY_HTTP.id
}
resource "google_compute_global_forwarding_rule" "FWD_RULE_HTTPS" {
  name                  = "frontend-https"
  ip_address            = google_compute_global_address.EXTERNAL_L7LB_IP_ADDRESS.address
  port_range            = "443"
  target                = google_compute_target_https_proxy.TPROXY_HTTPS.id
}

