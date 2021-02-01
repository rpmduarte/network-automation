# SSL Certs
resource "google_compute_ssl_certificate" "SSL_CERT" {
  count          = length(var.site_hostnames)
  name           = replace(var.site_hostnames[count.index], ".", "-")
  private_key    = file("~/private/ssl/keys/${replace(var.site_hostnames[count.index], ".", "_")}.key")
  certificate    = file("~/private/ssl/certs/${replace(var.site_hostnames[count.index], ".", "_")}.cer")
  provider       = google-beta
}

