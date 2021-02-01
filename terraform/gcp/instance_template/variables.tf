<<<<<<< HEAD
variable "project_name" {
  type             = string
}

=======
>>>>>>> cae4151d5dad65c4e928b046f3ca4c4235d75e3f
variable "region_names" {
  type             = list(string)
}

locals {
  machine_type                   = "f1-micro"
  instance_template_name         = "f1-micro-debian"
  instance_template_description  = "F1 Micro, Debian 10 OS"
  source_image                   = "debian-cloud/debian-10"
}
