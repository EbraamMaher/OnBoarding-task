resource "google_storage_bucket" "backend" {
  name                        = var.backend_bucket
  location                    = var.region
  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }
}

terraform {
  backend "gcs" {
    bucket = "ebram-377521"
    prefix = "terraform/state"
  }
}