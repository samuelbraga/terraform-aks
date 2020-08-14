variable "log_analytics_workspace_name" {
  default = ""
  description = "Nome do workspace para analise e armazenamento de logs"
}

variable "log_analytics_workspace_location" {
  default = ""
  description = "Locatizacao do workspace para analise e armazenamento de logs"
}

variable "log_analytics_workspace_sku" {
  default = ""
  description = "Tipo de precificacao do workspace para analise e armazenamento de logs. Possíveis valores: Free, PerNode, Premium, Standard, Standalone, Unlimited e PerGB2018"
}

variable "resource_group_name" {
  default = ""
  description = "Nome do resource group onde será criado o log workspace"
}

variable "resource_group_location" {
  default = ""
  description = "Local onde esta instanciado o resource group"
}
