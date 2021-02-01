# Reserve External Static IP Address
resource "google_compute_global_address" "EXTERNAL_L7LB_IP_ADDRESS" {
  name               = "l7lb"
}

resource "google_compute_url_map" "URL_MAP" {
  name               = "urlmap"
<<<<<<< HEAD
  #default_service    = google_compute_backend_bucket.BACKEND_BUCKET.id
  default_service    = google_compute_backend_service.BACKEND_SERVICE.id
=======
  default_service    = google_compute_backend_bucket.BACKEND_BUCKET.id
  #default_service    = google_compute_backend_service.BACKEND_SERVICE.id
>>>>>>> cae4151d5dad65c4e928b046f3ca4c4235d75e3f
}

resource "google_compute_target_http_proxy" "TPROXY_HTTP" {
  name                  = "target-proxy-http"
  url_map               = google_compute_url_map.URL_MAP.id
}

<<<<<<< HEAD
# SSL Certs
resource "google_compute_ssl_certificate" "SSL_CERT" {
  count          = length(var.site_hostnames)
  name           = replace(var.site_hostnames[count.index], ".", "-")
  private_key    = file("~/automation/ssl_certs/${replace(var.site_hostnames[count.index], ".", "_")}.key")
  certificate    = file("~/automation/ssl_certs/${replace(var.site_hostnames[count.index], ".", "_")}.cer")
  provider       = google-beta
}

=======
>>>>>>> cae4151d5dad65c4e928b046f3ca4c4235d75e3f
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

<<<<<<< HEAD
output l7lb_external_ip_address { value = google_compute_global_address.EXTERNAL_L7LB_IP_ADDRESS.*.address }
=======
#output l7lb_external_ip_address { value = google_compute_global_address.EXTERNAL_L7LB_IP_ADDRESS.*.address }
>>>>>>> cae4151d5dad65c4e928b046f3ca4c4235d75e3f
