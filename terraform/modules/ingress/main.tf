provider "helm" {
    kubernetes {
        load_config_file       = "false"
        host                   = var.host
        username               = var.cluster_username
        password               = var.cluster_password
        client_certificate     = base64decode(var.client_certificate)
        client_key             = base64decode(var.client_key)
        cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
    }
}

resource "helm_release" "ingress" {
    name             = "nginx-ingress"
    repository       = "https://kubernetes-charts.storage.googleapis.com"
    chart            = var.chart_name
    version          = var.chart_version
    namespace        = "kube-system"
    lint             = true
    atomic           = true
    cleanup_on_fail  = true
    create_namespace = true
}
