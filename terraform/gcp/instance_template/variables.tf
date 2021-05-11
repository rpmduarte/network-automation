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

variable "source_image" {
  type             = string
  default          = "debian-cloud/debian-10"
}

variable "instace_template_name" {
  type             = string
  default          = "f1-micro-debian"
}

variable "startup_script" {
  type             = string
  default          = "sudo apt install -y git python3-pip wget tcpdump telnet dnsutils"
}

