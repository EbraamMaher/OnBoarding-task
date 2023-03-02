##For Root module
variable "project_id" {
  type        = string
  description = "ID of the dedicated project"
}

variable "region" {
  type        = string
  description = "region to be used"

}

variable "backend_bucket" {
  type        = string
  description = "region to be used"

}

variable "main_zone" { 
  type        = string
  description = "zone to be used"
}



##########Network###############
variable "network_name" {
  #retreived from main directory
  type        = string
  description = "Region at which we will provision our resources"
}

variable "subnet_name" {
  #retreived from main directory
  type        = string
  description = "Name of the subnet"
}

variable "subnet-cider" {
  #retreived from main directory
  type        = string
  description = "cider-range for the subnet"
}

variable "ssh_source_ranges" {
  type        = list
  description = "cider-range for the auhtorized ips"
}


########VM#################
variable "machine_name" {
  type        = string
  description = "name of the vm instance to be used as bastion"
}


variable "machine_type" {
  type        = string
  description = "type of the machine"
}


variable "OS_image" {
  type        = string
  description = "os-image of the machine"
}



# #####GKE########

variable "cluster_region" {
  type = string
}

variable "cluster_zones_list" {
  type        = list(string)
  description = "The zones where Kubernetes cluster worker nodes should be located"
}

variable "nodes_machine_type" {
  type = string
}


variable "nodes_disk_type"{
  type        = string
}

variable "nodes_disk_size"{
  type        = string
}

variable "nodes_image_type"{
  type        = string
}



variable "number_of_node_per_zone" {
  type = number
}

variable "cluster_name" {
  type = string
}

variable "master_node_cidr" {
  type        = string
  description = "cider range for master cluster"
}


variable "pods_ipv4_cidr_block" {
  type        = string
  description = "cider range for pods"
}

variable "cluster_services_ip_cidr_range" {
  type        = string
  description = "cider range for services"

}

variable "master_location" {
  type = string
}

######Buckets#####

variable "buckets_names" {
  ##retrieved form network module
  type        = list(any)
  description = "The name of the network that should be used."
}

variable "storage_class" {
  ##retrieved form network module
  type        = list(string)
  description = "The name of the network that should be used."
}



#######BigQuery######
variable "dataset_name" {

  description = "name of the dataset"
  type        = list(string)
}


variable "dataset_location" {
  description = "list of location for each database"
  type        = list(any)
}

