variable "region" {
  type = string
  default = "us-central1"
}

variable "name_gcp_gke" {
  default = "usc-gke-cluster"
}

variable "project_id" {
  description = "project id"
  default = "jcascgke"
}

variable "jenkins_password" {
  default = "admin"
}

variable "jenkins_path" {
  default = "/jenkins"
}