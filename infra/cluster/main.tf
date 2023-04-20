
resource "google_container_cluster" "gke" {
  name    = var.name_gcp_gke
  enable_autopilot = true
  location = var.region
  ip_allocation_policy {
  }
}