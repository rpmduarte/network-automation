# Variables for GCP Side of tunnel
variable "region"                      { type = string }
variable "vpn_gateway_name"            { type = string }
variable "project_name"                { type = string }
variable "credentials_file"            { type = string }

# Variables for Peer VPN Gateway
variable "peer_gateway_name"           { type = string }
variable "cloud_router_name"           { type = string }
variable "peer_gateway_description"    {
  type = string 
  default = "Peer VPN Gateway"
}

# Primary VPN Tunnel
variable "peer0_vpn_name" {
  type = string
  default = "${var.peer_gateway_name}-tun0"
}
variable "peer0_public_ip" {
  type = string 
}
variable "peer0_psk"                { 
  type = string
  default = "abcdefghij1234567890"
}
variable "peer0_local_ip" {
  type = string
  default = "169.254.0.1/30"
}
variable "peer0_remote_ip" {
  type = string
  default = "169.254.0.2"
}
variable "peer0_bgp_asn" { 
  type = number
  default = 6500
}
variable "peer0_adv_mode" {
  type = string
  default = "DEFAULT"
}
variable "peer0_adv_prefix" { 
  type = string
  default = ""
}
variable "peer0_adv_metric" { 
  type = number 
  default = 1
}

# Secondary VPN Tunnel
variable "peer1_vpn_name" {
  type = string
  default = "${var.peer_gateway_name}-tun1"
}
variable "peer1_public_ip" { 
  type = string 
}
variable "peer1_psk" { 
  type = string
  default = "abcdefghij1234567890"
}
variable "peer1_local_ip" {
  type = string
  default = "169.254.0.5/30"
}
variable "peer1_remote_ip" {
  type = string
  default = "169.254.0.6"
}
variable "peer1_bgp_asn" {
  type = number
  default = 6500
}
variable "peer1_adv_mode" {
  type = string
  default = "DEFAULT"
}
variable "peer1_adv_prefix" { 
  type = string 
  default = ""
}
variable "peer1_adv_metric" { 
  type = number 
  default = 1
}

