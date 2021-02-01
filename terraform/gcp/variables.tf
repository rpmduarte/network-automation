variable "project_name" {
  type              = string
}

variable "credentials_file" { 
  type              = string
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

variable "site_hostnames" {
  type             = list(string)
}

