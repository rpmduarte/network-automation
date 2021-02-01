variable "project_name" {
  type                 = string
}

variable "region_names" {
  type                 = list(string)
}
variable "site_hostnames" {
  type                 = list(string)
}

locals {
  instance_group_name  = "unmanaged-instance-group-us-central1"  
  backend_zone         = "us-central1-a"
  bucket_name          = "j5-org"
  ssl_policy           = "custom-ssl-policy"
}

output l7lb_external_ip_address { value = google_compute_global_address.EXTERNAL_L7LB_IP_ADDRESS.*.address }
