
# Instance Template
resource "google_compute_instance_template" "INSTANCE_TEMPLATE" {
  name                         = var.instance_template_name
  machine_type                 = var.machine_type
  disk {
    source_image               = "${var.image_project}/${var.image_family}"
    auto_delete                = true
    boot                       = true
  }
  network_interface {
    network                    = "default"
  }
  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
  labels                       = { 
     os = var.image_family
  }
  metadata_startup_script      = var.startup_script
}

