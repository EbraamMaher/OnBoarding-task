data "template_file" "startup_script" {
  template = <<-EOF
sudo apt-get install kubectl
sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
  EOF
}


resource "google_compute_instance" "bastion" {
#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance
  name         = format("%s-bastion", var.bastion_name)
  machine_type = var.machine_type
  zone         = var.zone
  project      = var.project_id
  tags         = ["vm"]

  boot_disk {                           #R- boot disk for the instance.
    
    initialize_params {                 #O- Either "initialize_params" or "source" must be set.
     
      image = var.OS_image  
    }

  }
    

  allow_stopping_for_update = true

  network_interface {           #R- This can be specified multiple times.
    subnetwork = var.subnet_name      ##O- Either network or subnetwork must be provided. If network isn't provided it will be inferred from the subnetwork.
  }

  service_account {
    
    email  =  var.vm-sa-email #O- The SA e-mail address. If not given, the default Google Compute Engine SA is used.
    scopes = ["cloud-platform"] ##["https://www.googleapis.com/auth/devstorage.read_only"]   #R- List of service scopes. Both OAuth2 URLs and gcloud short names are supported. To allow full access to all Cloud APIs, use the cloud-platform scope
  }
  metadata_startup_script = data.template_file.startup_script.rendered

}
