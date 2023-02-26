
variable "project_id" {
  #retreived from main directory
  type = string
  description = "The project ID to host the network in."
}

variable "buckets_names" {
  ##retrieved form network module
  type        = list(string)
  description = "The name of the network that should be used."
}


variable "region" {
  type        = string
  description = "region to be used"

}

variable "storage_class" {
  ##retrieved form network module
  type        = list(string)
  description = "The name of the network that should be used."
}
