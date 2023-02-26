
module "google_networks" {
  source = "/home/ebraam/projects/Neuron-onboarding"

  project_id = var.project_id
  region     = var.region

  network_name = var.network_name
  subnet_name  = var.subnet_name
  subnet-cider = var.subnet-cider
}

module "service_accounts" {
  source = "./modules/service_accounts"

  project_id = var.project_id
}

module "bastion" {
  source = "./modules/bastion"

  project_id = var.project_id
  region     = var.region

  network_name = module.google_networks.network.name
  subnet_name  = module.google_networks.subnet.name

  zone         = var.main_zone
  bastion_name = var.machine_name 
  machine_type = var.machine_type
  OS_image     = var.OS_image
  vm-sa-email     = module.service_accounts.vm-sa-email
}


module "google_kubernetes_cluster" {
  source = "./modules/k8s-cluster"

  project_id = var.project_id

  network_name = module.google_networks.network.name
  subnet_name  = module.google_networks.subnet.name ##put the cluster in the restricted subnet

  cluster_region          = var.cluster_region
  cluster_zones_list      = var.cluster_zones_list
  nodes_machine_type      = var.nodes_machine_type
  number_of_node_per_zone = var.number_of_node_per_zone
  cluster_name            = var.cluster_name
  master_node_cidr        = var.master_node_cidr

  pods_ipv4_cidr_block           = var.pods_ipv4_cidr_block
  cluster_services_ip_cidr_range = var.cluster_services_ip_cidr_range

  authorized_ipv4_cidr_block = "${module.bastion.ip}/32" #bastion IP to be putted in authorized networks
  master_location            = var.master_location

  gke_service_account            = module.service_accounts.cluster-sa-email
}

module "buckets" {
  source = "./buckets"

  project_id    = var.project_id
  buckets_names = var.buckets_names
  region        = var.region
  storage_class = var.storage_class
}

module "BigQuery" {
  source = "./modules/bigQuery"

  dataset_name     = var.dataset_name
  dataset_location = var.dataset_location
}
