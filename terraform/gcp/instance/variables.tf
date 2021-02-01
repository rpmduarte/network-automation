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
