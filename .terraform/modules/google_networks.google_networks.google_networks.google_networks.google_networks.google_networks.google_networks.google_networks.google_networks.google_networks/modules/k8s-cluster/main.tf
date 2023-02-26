resource "google_container_cluster" "app_cluster" {
#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster  
  name       = var.cluster_name #"app-cluster"
  location   = var.master_location #"europe-west3-c" #var.cluster_region
  network    = var.network_name
  subnetwork = var.subnet_name
  cluster_autoscaling {
    enabled = false
  }
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = var.pods_ipv4_cidr_block
    services_ipv4_cidr_block = var.cluster_services_ip_cidr_range #var.services_ipv4_cidr_block
  }
  
  dynamic "master_authorized_networks_config" {
    for_each = var.authorized_ipv4_cidr_block != null ? [var.authorized_ipv4_cidr_block] : []
    
    content {
      cidr_blocks {
        cidr_block   = master_authorized_networks_config.value
        display_name = "External Control Plane access"
      }
    }
  }

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }
    private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = var.master_node_cidr #var.master_ipv4_cidr_block
  }
}

####################################

resource "google_container_node_pool" "app_cluster_linux_node_pool" {
#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool

  name           = "${google_container_cluster.app_cluster.name}--linux-node-pool"
  location       = google_container_cluster.app_cluster.location
  node_locations = var.cluster_zones_list
  cluster        = google_container_cluster.app_cluster.name
  node_count     = var.number_of_node_per_zone
  

  node_config {
    disk_type = "pd-standard"
    disk_size_gb = 100 ##var.node_disk_size
    machine_type = var.nodes_machine_type #"e2-standard-2"   
    image_type = "COS_CONTAINERD"
    service_account =  var.gke_service_account #google_service_account.cluster-sa.email
    
     oauth_scopes = [

 "cloud-platform"

     ]

  }

}
