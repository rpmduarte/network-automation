# Variables for GCP Side of tunnel
variable "region"                      { type = string }
variable "vpn_gateway_name"            { type = string }

# Variables for Peer VPN Gateway
variable "peer_gateway_name"           { type = string }
variable "peer_gateway_description"    {
  type = string 
  default = "Peer VPN Gateway"
}

# Primary VPN Tunnel
variable "peer_0_public_ip" {
  type = string 
}
variable "tun_0_psk"                { 
  type = string
  default = "abcdefghij1234567890"
}
variable "peer_0_local_ip" {
  type = string
  default = "169.254.0.1/30"
}
variable "peer_0_remote_ip" {
  type = string
  default = "169.254.0.2"
}
variable "peer_0_bgp_asn" { 
  type = number
  default = 6500
}
variable "peer_0_custom_adv"               {
  type = bool
  default = false
}
variable "tun_0_adv_prefix" { 
  type = string 
}
variable "peer_0_adv_metric" { 
  type = number 
  default = 100
}

# Secondary VPN Tunnel
variable "peer_1_public_ip" { 
  type = string 
}
variable "tun_1_psk" { 
  type = string
  default = "abcdefghij1234567890"
}
variable "peer_1_local_ip" {
  type = string
  default = "169.254.0.5/30"
}
variable "peer_1_remote_ip" {
  type = string
  default = "169.254.0.6"
}
variable "peer_1_bgp_asn" {
  type = number
  default = 6500
}
variable "peer_1_custom_adv" {
  type = bool
  default = false
}
variable "tun_1_adv_prefix" { 
  type = string 
}
variable "peer_1_adv_metric" { 
  type = number 
  default = 200
}

