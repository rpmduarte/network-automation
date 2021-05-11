variable "project_name" {
  type              = string
}

variable "credentials_file" { 
  type              = string
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

variable "site_hostnames" {
  type             = list(string)
}

