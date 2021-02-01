
# Instance Template
resource "google_compute_instance_template" "F1_MICRO_DEBIAN" {
  count                        = length(var.region_names)
  name                         = local.instance_template_name
  description                  = local.instance_template_description
  machine_type                 = local.machine_type
  disk {
    source_image               = local.source_image
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
  metadata_startup_script      = "sudo apt install -y git python3-pip wget tcpdump telnet dnsutils"
}

