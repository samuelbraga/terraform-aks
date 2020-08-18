variable "resource_group_name" {
    default = ""
    description = "Nome do resource group onde será criado o log workspace"
}

variable "resource_group_location" {
    default = ""
    description = "Local onde esta instanciado o resource group"
}

variable "acr_name" {
    default = ""
    description = "Nome do azure container service"
}

variable "acr_sku" {
    default = ""
    description = "Classe do servico ACR"
}
