#https://github.com/bitnami/charts/blob/main/bitnami/nginx-ingress-controller/values.yaml
resource "helm_release" "nginx-ingress" {
  name       = "nginx"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx-ingress-controller"

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
  set {
    name  = "service.loadBalancerIP"
    value = google_compute_address.ip_static.address
  }
  depends_on = [google_compute_address.ip_static]
}