data "google_client_config" "default" {}


data "google_container_cluster" "gke" {
  name = var.name_gcp_gke
  location = var.region
}

