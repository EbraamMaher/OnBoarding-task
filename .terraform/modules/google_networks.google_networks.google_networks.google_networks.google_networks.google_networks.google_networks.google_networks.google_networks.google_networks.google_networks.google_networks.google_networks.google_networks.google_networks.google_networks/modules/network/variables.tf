variable "project_id" {
  #retreived from main directory
  type        = string
  description = "ID of the project at which the project will be created"
}

variable "region" {
  #retreived from main directory
  type        = string
  description = "Region at which we will provision our resources"
}

variable "network_name" {
  #retreived from main directory
  type        = string
  description = "Name of the VPC to be created"
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