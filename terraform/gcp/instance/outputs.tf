output instance_name { value = google_compute_instance_from_template.INSTANCE.*.name }
output zone { value = google_compute_instance_from_template.INSTANCE.*.zone }
