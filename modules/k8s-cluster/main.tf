/*=============Master=============*/

resource "google_container_cluster" "app_cluster" {
  name       = var.cluster_name 
  location   = var.master_location 
  network    = var.network_name
  subnetwork = var.subnet_name
  cluster_autoscaling {
    enabled = false
  }
  remove_default_node_pool = true
  initial_node_count       = 1

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = var.pods_ipv4_cidr_block
    services_ipv4_cidr_block = var.cluster_services_ip_cidr_range 
  }
  
  dynamic "master_authorized_networks_config" {
    for_each = var.authorized_ipv4_cidr_block != null ? [var.authorized_ipv4_cidr_block] : []
    
    content {
      cidr_blocks {
        cidr_block   = master_authorized_networks_config.value
        display_name = "bastion access to cluster"
      }
   }
  }
  # master_authorized_networks_config {
  #       cidr_blocks {
  #           cidr_block   = authorized_ipv4_cidr_block
  #           display_name = "bastion access to cluster"
  #       }
  # }

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }
    private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = var.master_node_cidr 
  }
}

/*============= Nodes=============*/

resource "google_container_node_pool" "app_cluster_linux_node_pool" {

  name           = "${google_container_cluster.app_cluster.name}--linux-node-pool"
  location       = google_container_cluster.app_cluster.location
  node_locations = var.cluster_zones_list
  cluster        = google_container_cluster.app_cluster.name
  node_count     = var.number_of_node_per_zone
  

  node_config {
    disk_type = "pd-standard"
    disk_size_gb = 100 ##var.node_disk_size
    machine_type = var.nodes_machine_type   
    image_type = "COS_CONTAINERD"    ##var.node_image_type
    service_account =  var.gke_service_account 
    
     oauth_scopes = [

 "cloud-platform"

     ]

  }

}

