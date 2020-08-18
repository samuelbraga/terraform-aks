resource "null_resource" "aks_with_acr" {
    provisioner "local-exec" {
        command = "az aks update -n ${cluster_name} -g ${resource_group_name} --attach-acr $(az acr show -n ${acr_name} --query "id" -o tsv)"
    }
}
