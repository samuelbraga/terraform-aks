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
    name             = "nginx"
    repository       = "https://kubernetes-charts.storage.googleapis.com"
    chart            = var.ingress_chart_name
    version          = var.ingress_chart_version
    namespace        = "kube-system"
    lint             = true
    atomic           = true
    cleanup_on_fail  = true
    create_namespace = true

    values = [
        file("${path.module}/ingress/values.yaml")
    ]
}

resource "helm_release" "prometheus" {
    name             = "prometheus"
    repository       = "https://kubernetes-charts.storage.googleapis.com"
    chart            = var.prometheus_chart_name
    version          = var.prometheus_chart_version
    namespace        = "monitoramento"
    lint             = true
    atomic           = true
    cleanup_on_fail  = true
    create_namespace = true
    timeout          = 1200

    values = [
        file("${path.module}/prometheus/values.yaml")
    ]

    depends_on = [helm_release.ingress]
}

