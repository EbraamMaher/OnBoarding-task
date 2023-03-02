data "template_file" "startup_script" {
  template = <<-EOF
sudo apt-get install kubectl
sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
  EOF
}


resource "google_compute_instance" "bastion" {
  name         = var.bastion_name
  machine_type = var.machine_type
  zone         = var.zone
  project      = var.project_id
  tags         = ["vm"]

  boot_disk {                           
    
    initialize_params {                 

      image = var.OS_image  
    }

  }
    

  allow_stopping_for_update = true

  network_interface {           
    subnetwork = var.subnet_name      
  }

  service_account {
    
    email  =  var.vm-sa-email 
    scopes = ["cloud-platform"]  
  }
  metadata_startup_script = data.template_file.startup_script.rendered

}
