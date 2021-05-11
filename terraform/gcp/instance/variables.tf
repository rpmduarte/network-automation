variable "credentials_file" {
  type             = string
}

variable "project_name" {
  type             = string
}

variable "vpc_network_name" {
  type             = string
}

variable "regions" {
  type             = list(string)
}

variable "network_cidrs" {
  type             = list(string)
}

variable "instance_network_tags" {
  type             = list(string)
  default          = []
}

locals {
  instance_template_name   = "f1-micro-debian"
  zones_list               = ["b", "c"]
}

output instance_name { value = google_compute_instance_from_template.INSTANCE.*.name }
output zone { value = google_compute_instance_from_template.INSTANCE.*.zone }
