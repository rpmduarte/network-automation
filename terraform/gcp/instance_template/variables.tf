variable "project_name" {
  type             = string
}

variable "region_names" {
  type             = list(string)
}

variables "machine_type" {
  type             = string
  default          = "f1-micro"
}

variables "source_image" {
  type             = string
  default          = "debian-cloud/debian-10"
}

variables "instace_template_name" {
  type             = string
  default          = "f1-micro-debian"
}

variable "startup_script" {
  type             = string
  default          = "sudo apt install -y git python3-pip wget tcpdump telnet dnsutils"
}

