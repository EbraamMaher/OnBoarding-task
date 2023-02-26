output "network" {
  value       = google_compute_network.vpc
  description = "The VPC"
}

##management subnt
output "subnet" {
  value       = google_compute_subnetwork.subnet
  description = "The Public subnet"
}
