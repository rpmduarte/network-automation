variable "credentials_file" {
  type             = string
}

variable "project_name" {
  type             = string
}

variable "project_id" {
  type             = string
}

variable "vpc_network_name" {
  type             = string
}

variable "regions" {
  type             = list(string)
}

output cloud_nat_names { value = google_compute_address.CLOUD_NAT_EXTERNAL_ADDRESS.*.name }
output cloud_nat_external_ips { value = google_compute_address.CLOUD_NAT_EXTERNAL_ADDRESS.*.address }
output cloud_nat_regions { value = google_compute_address.CLOUD_NAT_EXTERNAL_ADDRESS.*.region }
