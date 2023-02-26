output "ip" {
  
  value       = google_compute_instance.bastion.network_interface.0.network_ip
  description = "The IP address of the Bastion instance."
}

output "ssh" {
  
  value       = "gcloud compute ssh ${google_compute_instance.bastion.name} --project ${var.project_id} --zone ${google_compute_instance.bastion.zone}"
  description = "ssh command to connect to the Bastion instance."
}


# output "service_account" {
#   value       = google_service_account.service_account
# }


# output "service_account_command" {
  
#   value       = "gcloud iam service-accounts keys create ls-storage --iam-account= ${google_service_account.service_account.email}"
#   description = "gcloud command to create key from the SA"
# }
