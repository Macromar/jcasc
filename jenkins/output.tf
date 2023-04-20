output "static_ip" {
  value = google_compute_address.ip_static.address
}

output "jenkins_url" {
  value = "http://${google_compute_address.ip_static.address}${var.jenkins_path}"
}