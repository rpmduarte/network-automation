# Create backend bucket
resource "google_compute_backend_bucket" "BACKEND_BUCKET" {
  bucket_name        = local.bucket_name
  name               = "backend-bucket-${local.bucket_name}"
  enable_cdn         = false
}
