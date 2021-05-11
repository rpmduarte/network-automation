
# Instance Template
resource "google_compute_instance_template" "INSTANCE_TEMPLATE" {
  count                        = length(var.regions)
  name                         = var.instance_template_name
  machine_type                 = var.machine_type
  disk {
    source_image               = var.source_image
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
     os = "debian"
  }
  metadata_startup_script      = var.startup_script
}

