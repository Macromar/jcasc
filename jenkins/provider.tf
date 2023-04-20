terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
    }
    google = {
      source  = "hashicorp/google"
    }
    docker = {
      source  = "kreuzwerker/docker"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region

}


provider "kubernetes" {
  host     = "https://${data.google_container_cluster.gke.endpoint}"
  token = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.gke.master_auth[0].cluster_ca_certificate,
  )

}

provider "helm" {
  kubernetes {
    host  = "https://${data.google_container_cluster.gke.endpoint}"
    token = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(
      data.google_container_cluster.gke.master_auth[0].cluster_ca_certificate
    )
  }
}

data "terraform_remote_state" "cluster" {
  backend = "local"
  config = {
    path = "./../infra/cluster/terraform.tfstate"
  }
}