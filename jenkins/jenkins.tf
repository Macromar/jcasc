#https://github.com/jenkinsci/helm-charts/blob/main/charts/jenkins/values.yaml
resource "helm_release" "jenkins" {
  provider     = helm
  name         = "jenkins"
  repository   = "https://charts.jenkins.io"
  chart        = "jenkins"
  force_update = true
  timeout      = 400
  values       = [
    file("./yaml_files/values.yaml"),
  ]

  set_sensitive {
    name  = "controller.adminPassword"
    value = var.jenkins_password
  }
  set {
    name  = "controller.jenkinsUriPrefix"
    value = var.jenkins_path
  }
  set {
    name  = "controller.ingress.path"
    value = var.jenkins_path
  }
  set {
    name  = "controller.jenkinsUrl"
    value = "http://${google_compute_address.ip_static.address}${var.jenkins_path}"
  }
  depends_on = [google_compute_address.ip_static]
}
