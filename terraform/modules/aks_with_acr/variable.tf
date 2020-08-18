variable "cluster_name" {
    default = ""
    description = "Nome do cluster AKS que será criado" 
}

variable "resource_group_name" {
    default = ""
    description = "Nome do resource group onde será criado o log workspace"
}

variable "acr_name" {
    default = ""
    description = "Nome do azure container service"
}
