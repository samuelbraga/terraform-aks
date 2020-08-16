resource "null_resource" "helm_init" {
  provisioner "local-exec" {
    command = "echo ${var.kube_config} > ./kube/aks.kubeconfig"
  }

  provisioner "local-exec" {
    command = "export KUBECONFIG=/kube/aks.kubeconfig"
  }

  provisioner "local-exec" {
    command = "helm init"
    environment {
      KUBECONFIG = "/kube/aks.kubeconfig"
    }
  }
}
