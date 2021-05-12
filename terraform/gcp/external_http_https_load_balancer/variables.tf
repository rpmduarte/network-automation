variable "credentials_file" {
  type             = string
}

variable "project_name" {
  type                 = string
}

variable "project_id" {
  type                 = string
}

variable "regions" {
  type                 = list(string)
}

variable "http_check1_name" {
  type             = string
  default          = "http-1"
}

variable "http_check1_port" {
  type            = number
  default         = 80
}

variable "http_check1_path" {
  type            = string
  default         = "/"
}

variable "http_check2_name" {
  type             = string
  default          = "http-2"
}

variable "http_check2_port" {
  type            = number
  default         = 80
}

variable "http_check2_path" {
  type            = string
  default         = "/"
}

variable "healthcheck_interval" {
  type             = number
  default          = 10
}

variable "healthcheck_timeout" {
  type             = string
  default          = 5
}

variable "site_hostnames" {
  type                 = list(string)
}

variable "bucket_name" {
  type                 = string
}

variable "ssl_policy" {
  type                 = string
  default              = "default"
}

variable "affinity_type" {
  type                 = string
  default              = "NONE"
}

locals {
  zones_list           = ["b", "c"]
}

output l7lb_external_ip_address { value = google_compute_global_address.EXTERNAL_L7LB_IP_ADDRESS.*.address }
