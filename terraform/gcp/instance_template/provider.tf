variable "credentials_file" { default = "~/private/websites-270319-0349651c1ffe.json" }

provider "google" {
  credentials                  = file(var.credentials_file)
  project                      = "websites-270319"
  region                       = "us-east4"
}

provider "google-beta" {
  credentials                  = file(var.credentials_file)
  project                      = "websites-270319"
  region                       = "us-east4"
}
