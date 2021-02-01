variable "project_name" {
  type             = string
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

locals {
  instance_template_name   = "f1-micro-debian"
  zones_list               = ["a", "b", "c"]
}
output instance_name { value = google_compute_instance_from_template.INSTANCE.*.name }
output zone { value = google_compute_instance_from_template.INSTANCE.*.zone }
