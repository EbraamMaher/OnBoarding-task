provider "google" {

  project = var.project_id
  region  = var.region #O- The default region to manage resources in. If another region is specified on a regional resource, it will take precedence.     
  #zone    = var.main_zone    #O- The default zone to manage resources in. Generally, this zone should be within the default region you specified. If another zone is specified on a zonal resource, it will take precedence.
  #credentials =              ##O- Either the path to or the contents of a service account key file in JSON format. You can manage key files using the Cloud Console. If not provided, the application default credentials will be used.
}



