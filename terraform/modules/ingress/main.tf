resource "null_resource" "kubeconfig" {
    provisioner "local-exec" {
        command = "rm $HOME/.kube/config && az aks get-credentials --name ${var.cluster_name} --resource-group ${var.resource_group_name} -f $HOME/.kube/config"
    }
}

resource "null_resource" "get_chart" {
    provisioner "local-exec" {
        command = "rm ${path.module}/charts/${var.chart_name}-${var.chart_version}.tgz && wget https://kubernetes-charts.storage.googleapis.com/${var.chart_name}-${var.chart_version}.tgz -P ${path.module}/charts"
    }
}

resource "null_resource" "descompact_chart" {
    provisioner "local-exec" {
        command = "rm -r ${path.module}/charts/${var.chart_name} && tar -C ${path.module}/charts -zxvf ${path.module}/charts/${var.chart_name}-${var.chart_version}.tgz"
    }

    depends_on = [null_resource.get_chart]
}

provider "helm" { }

resource "helm_release" "ingress" {
    name             = "nginx-ingress"
    chart            = "${path.module}/charts/${var.chart_name}"
    namespace        = "kube-system"
    lint             = true
    atomic           = true
    cleanup_on_fail  = true
    create_namespace = true

    depends_on = [null_resource.descompact_chart, null_resource.kubeconfig]
}
