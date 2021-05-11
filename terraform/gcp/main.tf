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
  regions             = var.regions
}

module "instance" {
  source              = "./instance"
  depends_on          = [module.instance_template]
  project_name        = var.project_name
  vpc_network_name    = var.network_names
  regions             = var.regions
  network_cidrs       = var.network_cidrs
}

#module "l7elb" {
#  source = "./l7elb"
#  depends_on          = [module.instance]
#  region_names        = var.region_names
#  site_hostnames      = var.site_hostnames
#  project_name        = var.project_name
#}
