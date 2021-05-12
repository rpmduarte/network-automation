# Reserve External Static IP Address
resource "google_compute_global_address" "EXTERNAL_L7LB_IP_ADDRESS" {
  name               = "external-http-https-load-balancer"
}


