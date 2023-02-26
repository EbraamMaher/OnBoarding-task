output "kubectl_command" {
  #value       = "gcloud container clusters get-credentials ${google_container_cluster.app_cluster.name} --region ${var.cluster_region} --project ${var.project_id}"
  description = "kubectl command to connect to cluster."
  value       = "gcloud container clusters get-credentials ${google_container_cluster.app_cluster.name} --zone ${var.master_location} --project ${var.project_id}"

}