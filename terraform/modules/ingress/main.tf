provider "helm" {
    kubernetes {
        host     = var.host
        username = var.cluster_username
        password = var.cluster_password

        client_certificate     = base64decode(var.client_certificate)
        client_key             = base64decode(var.client_key)
        cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
    }
}

resource "null_resource" "get_chart" {
    provisioner "local-exec" {
        command = "rm -r ${path.module}/charts/${var.chart_name}-${var.chart_version}.tgz && wget https://kubernetes-charts.storage.googleapis.com/${var.chart_name}-${var.chart_version}.tgz -P ${path.module}/charts"
    }
}

resource "null_resource" "descompact_chart" {
    provisioner "local-exec" {
        command = "rm -f ${path.module}/charts/${var.chart_name} && tar -C ${path.module}/charts -zxvf ${path.module}/charts/${var.chart_name}-${var.chart_version}.tgz"
    }

    depends_on = [null_resource.get_chart]
}

resource "helm_release" "ingress" {
    name             = "nginx-ingress"
    chart            = "${path.module}/charts/nginx-ingress"
    namespace        = "kube-system"
    verify           = true
    lint             = true
    atomic           = true
    cleanup_on_fail  = true
    create_namespace = true

    depends_on = [null_resource.descompact_chart]
}
