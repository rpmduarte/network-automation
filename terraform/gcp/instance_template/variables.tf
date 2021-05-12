variable "credentials_file" {
  type             = string
}

variable "project_name" {
  type             = string
}

variable "regions" {
  type             = list(string)
}

variable "machine_type" {
  type             = string
  default          = "f1-micro"
}

variable "image_project" {
  type             = string
  default          = "debian-cloud"
}

variable "image_family" {
  type             = string
  default          = "debian-10"
}

variable "instance_template_name" {
  type             = string
  default          = "f1-micro-debian"
}

variable "startup_script" {
  type             = string
  default          = "sudo apt install -y git python3-pip wget tcpdump telnet dnsutils"
}

