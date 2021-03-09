terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}
provider "google" {
  credentials      = file(var.credentials_file)
  project          = var.project_name
}
provider "google-beta" {
  credentials      = file(var.credentials_file)
  project          = var.project_name
}

module "instance_template" {
  source              = "./instance_template"
  region_names        = var.region_names
}

module "instance" {
  source              = "./instance"
  depends_on          = [module.instance_template]
  project_name        = var.project_name
  network_name        = var.network_name
  region_names        = var.region_names
  network_cidrs       = var.network_cidrs
}

#module "l7elb" {
#  source = "./l7elb"
#  depends_on          = [module.instance]
#  region_names        = var.region_names
#  site_hostnames      = var.site_hostnames
#  project_name        = var.project_name
#}
