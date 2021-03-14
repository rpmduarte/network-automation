provider "google" {
  credentials      = file(var.credentials_file)
  project          = var.project_name
}
provider "google-beta" {
  credentials      = file(var.credentials_file)
  project          = var.project_name
}
