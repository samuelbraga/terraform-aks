# Resource Group
variable "resource_group_name" {
    default = ""
    description = "Nome do resource group onde será implementado os recursos"
}

variable "resource_group_location" {
    default = ""
    description = "Nome da location do resource group onde será implementado os recursos"
}

# Identity
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

# Log Analytics Worksace
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

# AKS
variable "cluster_name" {
    default = ""
    description = "Nome do cluster AKS que será criado" 
}

variable "dns_prefix" {
    default = ""
    description = "Prefixo DNS para o cluster AKS AKS que será criado" 
}

variable "admin_username" {
    default = ""
    description = "Nome de usuario administrator para o S.O. dos nos do aks" 
}

variable "agent_name" {
    default = ""
    description = "Nome dos agentes do cluster AKS" 
}

variable "agent_count" {
    default = ""
    description = "Quantidade de agentes para o cluster AKS" 
}

variable "agent_vm_size" {
    default = ""
    description = "Tamanho da VM utilizada como agente do cluster AKS" 
}

variable "os_disk_size_gb" {
    default = ""
    description = "Tamanho dos discos de armazenamento dos nós do cluster"
}

variable "service_cidr" {
    default = ""
    description = "Um cidr block para atribuir IPs aos serviços do cluster"
}

variable "dns_service_ip" {
    default = ""
    description = "Endereço ip para o serviço de dns do cluster"
}

variable "docker_bridge_cidr" {
    default = ""
    description = "Um cidr block para uso do Docker."
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

variable "ingres_chart_name" {
    default = ""
    description = "Nome do chart que será utilizado para ingress"
}

variable "ingres_chart_version" {
    default = ""
    description = "Versao do chart que será utilizado para ingress"
}

variable "prometheus_chart_name" {
    default = ""
    description = "Nome do chart que será utilizado para o monitormaento do cluster"
}

variable "prometheus_chart_version" {
    default = ""
    description = "Versao do chart que será utilizado para monitoramento do cluster"
}

# ACR
variable "acr_name" {
    default = ""
    description = "Nome do azure container service"
}

variable "acr_sku" {
    default = ""
    description = "Classe do servico ACR"
}
