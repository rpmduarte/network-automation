# SSL Certs
resource "google_compute_ssl_certificate" "SSL_CERT" {
  count          = length(var.site_hostnames)
  name           = replace(var.site_hostnames[count.index], ".", "-")
<<<<<<< HEAD
  private_key    = file("~/automation/ssl_certs/${replace(var.site_hostnames[count.index], ".", "_")}.key")
  certificate    = file("~/automation/ssl_certs/${replace(var.site_hostnames[count.index], ".", "_")}.cer")
=======
  private_key    = file("~/private/ssl/keys/${replace(var.site_hostnames[count.index], ".", "_")}.key")
  certificate    = file("~/private/ssl/certs/${replace(var.site_hostnames[count.index], ".", "_")}.cer")
>>>>>>> cae4151d5dad65c4e928b046f3ca4c4235d75e3f
  provider       = google-beta
}

