resource "null_resource" "aks_with_acr" {
    provisioner "local-exec" {
        command = "az aks update -n ${var.cluster_name} -g ${var.resource_group_name} --attach-acr $(az acr show -n ${var.acr_name} --query \"id\" -o tsv)"
    }
}
