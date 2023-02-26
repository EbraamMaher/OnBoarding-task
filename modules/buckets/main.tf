resource "google_storage_bucket" "buckets" {
  location =  var.region
  count       = length(var.buckets_names) 
  name        = "${element(var.buckets_names, count.index)}-${var.project_id}" 
  uniform_bucket_level_access = true   
  force_destroy = true                
  storage_class = element(var.storage_class, count.index) 
}


