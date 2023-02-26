output "connect_to_bastion_command" {
  value       = module.bastion.ssh
  description = "Command  opens an SSH tunnel to the Bastion."
}

# output "service_account_command" {
#   value       = module.bastion.service_account_command
#   description = "Command  to create key dd."
# }

output "connect_to_cluster_command" {
  value       = module.google_kubernetes_cluster.kubectl_command
  description = "kubectl command to connect to cluster."
}