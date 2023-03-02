variable "project_id" {
  type        = string
  description = "ID of the project at which the project will be created"
}

variable "region" {
  type        = string
  description = "Region at which we will provision our resources"
}

variable "network_name" {
  type        = string
  description = "Name of the VPC to be created"
}


variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
}

variable "subnet-cider" {
  type        = string
  description = "cider-range for the subnet"
}

variable "ssh_source_ranges" {
  type        = list
  description = "cider-range for the auhtorized ips"
}
