variable "project_id" {
  #retreived from main directory
  type = string
  description = "The project ID to host the network in."
}

variable "network_name" {
  ##retrieved form network module
  type = string
  description = "The name of the network that should be used."
}

variable "subnet_name" {
  ##retrieved form network module
  type = string
  description = "The name of the subnet that should be used."
}

variable "cluster_region" {
  type        = string
}

variable "cluster_zones_list" {
  type        = list(string)
  description = "The zones where Kubernetes cluster worker nodes should be located"
}



variable "nodes_machine_type" {
  type        = string
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
  type        = number
}

variable "cluster_name" {
  type        = string
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


variable "gke_service_account" {
  type        = string
  description = "The GCP service account"
} 


variable "authorized_ipv4_cidr_block" {
  type        = string
}


variable "master_location" {
  type        = string
}
