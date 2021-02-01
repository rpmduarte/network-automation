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
<<<<<<< HEAD
  ssl.policy           = "custom-ssl-policy"
=======
  ssl_policy           = "custom-ssl-policy"
>>>>>>> cae4151d5dad65c4e928b046f3ca4c4235d75e3f
}
