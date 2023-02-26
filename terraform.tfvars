##Root##
project_id     = "ebram-377521"
backend_bucket = "ebram-377521"
region         = "us-central1"
main_zone      = "us-central1-a"


##Network Module##
network_name = "neuron"
subnet_name  = "neuron-subnet"
subnet-cider = "10.3.0.0/16"


##bastion Module##
machine_name = "bastion-0"
machine_type = "e2-micro"
OS_image     = "debian-cloud/debian-11"



##GKE Module##
cluster_region          = "us-central1"
cluster_zones_list      = ["us-central1-a", "us-central1-b"]
nodes_machine_type      = "e2-standard-2"
number_of_node_per_zone = 1
cluster_name            = "neuron-cluster"

master_node_cidr               = "172.16.0.0/28"
pods_ipv4_cidr_block           = "192.168.0.0/21"
cluster_services_ip_cidr_range = "192.168.8.0/27"

master_location = "us-central1-c"



##Buckets Module##
buckets_names = ["bucket-01", "bucket02", "bucket03"]
storage_class = ["STANDARD", "STANDARD", "STANDARD"]


###BigQuery Module##
dataset_name     = ["dataset01", "dataset02", "dataset03"]
dataset_location = ["EU", "EU", "US"]
