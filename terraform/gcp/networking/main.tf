locals {
  project_name             = "websites-270319"
}

variable "network_name" {
  type             = string
}

variable "region_names" {
  type             = list(string)
}

variable "network_cidrs" {
  type             = list(string)
}

output "subnet_id" {
  value       = google_compute_subnetwork.SUBNET.*.id
  description = "Subnet ID for each region"
}
