variable "network_name"             { type = string }
variable "region"          { type = string }
variable "cloud_router_bgp_asn"     { 
  type = number 
  default = 64512
}

locals {
  cloud_router_name = "cloudrouter-${var.network_name}-${var.region}"
  vpn_gateway_name  = "ha-vpn-gateway-${var.network_name}-${var.region}"
}
