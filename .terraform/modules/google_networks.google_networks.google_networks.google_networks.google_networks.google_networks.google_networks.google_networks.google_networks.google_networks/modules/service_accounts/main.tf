#########VM##########
#####################
resource "google_service_account" "vm-service-account" {
  #count = length()
  project      = var.project_id
  account_id   = "vm-service-account-01"
  display_name = "Service Account"
}


resource "google_project_iam_binding" "bq-viewer" {
  project      = var.project_id
  role         = "roles/bigquery.dataViewer" #"roles/storage.admin" 

  members = [
    "serviceAccount:${google_service_account.vm-service-account.email}",
  ]
}


resource "google_project_iam_binding" "container-admin" {
  project      = var.project_id
  role         = "roles/container.admin" #"roles/storage.admin" 

  members = [
    "serviceAccount:${google_service_account.vm-service-account.email}",
  ]
}

###############GKE################
##################################
resource "google_service_account" "cluster-service-account" {
  project      = var.project_id
  account_id   = "cluster-sa-id"
  display_name = "Service Account"

}

resource "google_project_iam_binding" "gcr-read-only" {
  project      = var.project_id
  role         = "roles/storage.objectViewer"  #"roles/artifactregistry.reader" 

  members = [
    "serviceAccount:${google_service_account.cluster-service-account.email}",
  ]
}

###"roles/storage.objectViewer" and "roles/artifactregistry.reader" both enable the vm to pull images