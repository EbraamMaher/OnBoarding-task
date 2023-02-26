resource "google_storage_bucket" "buckets" {
  location =  var.region
  count       = length(var.buckets_names) 
  name        = "${element(var.buckets_names, count.index)}-${var.project_id}" #var.backend_bucket  ##element(format("%s-%s", var.bucket_name,var.project_id) , count.index)
  uniform_bucket_level_access = true   ##apply the same permissions on all objects
  force_destroy = true                 ##enable deletion even if there are objects inside this bucket
  storage_class = element(var.storage_class, count.index) #"STANDARD"
}


