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

variable "healthcheck_name" {
  type             = string
  default          = "tcp-80"
}

variable "healthcheck_interval" {
  type             = number
  default          = 10
}

variable "healthcheck_timeout" {
  type             = string
  default          = 5
}  

variable "backend_port" {
  type             = string
  default          = "80"
}  

variable "frontend_port" {
  type             = string
  default          = "80"
}  

variable "affinity_type" {
  type             = string
  default          = "NONE"
}  

variable "allow_global_access" {
  type             = bool
  default          = false
}

locals {
  zones_list               = ["b", "c"]
}

output lb_backed_names { value = google_compute_region_backend_service.BACKEND_SERVICE.*.name }
output lb_backed_regions { value = google_compute_region_backend_service.BACKEND_SERVICE.*.region }
output lb_frontend_names { value = google_compute_forwarding_rule.FRONTEND.*.name }
output lb_frontend_regions { value = google_compute_forwarding_rule.FRONTEND.*.region }

