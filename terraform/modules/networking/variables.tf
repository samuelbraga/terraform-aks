variable "resource_group_name" {
  default = ""
  description = "Nome do resource group onde será criado o log workspace"
}

variable "resource_group_location" {
  default = ""
  description = "Local onde esta instanciado o resource group"
}

variable "vnet_name" {
    default = ""
    description = "Nome da rede virtual onde sera provisionado o cluster AKS"
}

variable "vnet_cidr_blocks" {
    type = list(string)
    default = [""]
    description = "Lista de cidr blocks da vnet"
}

variable "subnet_name" {
    default = ""
    description = "Nome da subnet onde sera provisionado o cluster AKS"
}

variable "subnet_cidr_blocks" {
    type = list(string)
    default = [""]
    description = "Lista de cidr blocks da subnet"
}

variable "nsg_name" {
    default = ""
    description = "Nome da network security group que será utilizada pela subnet"
}
