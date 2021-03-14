variable "vpc_network_name"     {
  type = string
}
variable "region"               {
  type = string
}
variable "cloud_router_bgp_asn" { 
  type = number 
  default = 64512
}
variable "project_name" {
  type = string
}
variable "credentials_file" {
  type = string
}

locals {
  cloud_router_name = "cloudrouter-${var.vpc_network_name}-${var.region}"
  vpn_gateway_name  = "ha-vpn-gateway-${var.vpc_network_name}-${var.region}"
}
