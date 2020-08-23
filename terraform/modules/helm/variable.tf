variable "cluster_name" {
    default = ""
    description = "Nome do cluster AKS que será criado" 
}

variable "resource_group_name" {
    default = ""
    description = "Nome do resource group onde será criado o log workspace"
}

variable "client_key" {
    default = ""
    description = "Client key para acesso ai cluster AKS" 
}

variable "client_certificate" {
    default = ""
    description = "Client certificate para acesso ai cluster AKS" 
}

variable "cluster_ca_certificate" {
    default = ""
    description = "Cluster ca certificate para acesso ai cluster AKS" 
}

variable "cluster_username" {
    default = ""
    description = "Cluster username para acesso ai cluster AKS" 
}

variable "cluster_password" {
    default = ""
    description = "Cluster Password para acesso ai cluster AKS" 
}

variable "kube_config" {
    default = ""
    description = "Kubeconfig para acesso ai cluster AKS" 
}

variable "host" {
    default = ""
    description = "Host para acesso ai cluster AKS" 
}

variable "ingress_chart_name" {
    default = ""
    description = "Nome do chart que será utilizado para ingress"
}

variable "ingress_chart_version" {
    default = ""
    description = "Versao do chart que será utilizado para ingress"
}

variable "prometheus_chart_name" {
    default = ""
    description = "Nome do chart que será utilizado para ingress"
}

variable "prometheus_chart_version" {
    default = ""
    description = "Versao do chart que será utilizado para ingress"
}
