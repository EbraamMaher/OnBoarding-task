
/*=============VPC=============*/
resource "google_compute_network" "vpc" {
  name                            = var.network_name 
  auto_create_subnetworks         = false              
}


/*=============Subnets=============*/
resource "google_compute_subnetwork" "subnet" {
  name                     = var.subnet_name     
  ip_cidr_range            = var.subnet-cider                  
  region                   = var.region                      
  network                  = google_compute_network.vpc.name 
  private_ip_google_access = true       
}


/*=============Firewall Rules=============*/
resource "google_compute_firewall" "ssh" {
  name          = "allowing-ssh"
  network       = var.network_name                             
  direction     = "INGRESS"
  project       = var.project_id
  source_ranges = var.ssh_source_ranges
  target_tags = ["vm"]
  depends_on = [
    google_compute_network.vpc
  ]
  allow {
    protocol = "tcp"  
    ports    = ["22"]  
  } 

}
