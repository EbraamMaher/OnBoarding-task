
resource "google_storage_bucket" "backend" {
  name                        = var.backend_bucket
  location                    = var.region
  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }
}

# ##This will reference a terraform.tfstate file in the terraform/state path inside a bucket in cloud storage
terraform {
  backend "gcs" {
    bucket = "ebram-377521"    ##bucket name
    prefix = "terraform/state" ##path in which we put the state file
  }
}