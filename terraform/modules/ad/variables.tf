variable "application_identity_name" {
  default = ""
  description = "Nome do application identity do aks"
}

variable "application_identity_type" {
  default = ""
  description = "Tipo do application identity do aks"
}

variable "service_principal_end_date" {
  default = ""
  description = "Date de validade para a senha do service principal"
}
