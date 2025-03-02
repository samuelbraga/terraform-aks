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

variable "resource_group_name" {
    default = ""
    description = "Nome do resource group onde será criado o log workspace"
}

variable "resource_group_location" {
    default = ""
    description = "Local onde esta instanciado o resource group"
}

variable "public_key_data" {
    default = ""
    description = "Valor da chave publica para acesso via SSH ao cluster"
}

variable "client_id" {
    default = ""
    description = "Client id para execução do AKS dentro da Azure"
}

variable "client_secret" {
    default = ""
    description = "Senha do client para autenticação do mesmo"
}

variable "log_analytics_workspace_id" {
    default = ""
    description = "Variável para interação do AKS com o log workspace"
}

variable "subnet_id" {
    default = ""
    description = "ID da subnet onde será provisionado o cluster AKS"
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
