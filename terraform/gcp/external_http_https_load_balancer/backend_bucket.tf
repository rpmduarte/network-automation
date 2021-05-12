# Create backend bucket
resource "google_compute_backend_bucket" "BACKEND_BUCKET" {
  bucket_name        = var.bucket_name
  name               = "backend-bucket-${var.bucket_name}"
  enable_cdn         = false
}
