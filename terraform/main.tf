module "ad" {
    source   = "./modules/ad"

    application_identity_name  = var.application_identity_name
    application_identity_type  = var.application_identity_type
    service_principal_end_date = var.service_principal_end_date
}

module "resource_group" {
    source   = "./modules/resource_group"

    resource_group_name     = var.resource_group_name
    resource_group_location = var.resource_group_location
}

module "log_analytics" {
    source   = "./modules/log_analytics"

    log_analytics_workspace_name     = "aks-samuel"
    log_analytics_workspace_location = "East US"
    log_analytics_workspace_sku      = "Free"

    resource_group_name     = module.resource_group.resource_group_name
    resource_group_location = module.resource_group.resource_group_location
}

module "key_pair" {
    source   = "./modules/key_pair"
}

module "networking" {
    source   = "./modules/networking"

    vnet_name          = var.vnet_name
    vnet_cidr_blocks   = var.vnet_cidr_blocks
    subnet_name        = var.subnet_name
    subnet_cidr_blocks = var.subnet_cidr_blocks
    nsg_name           = var.nsg_name

    resource_group_name     = module.resource_group.resource_group_name
    resource_group_location = module.resource_group.resource_group_location
}

module "acr" {
    source = "./modules/acr"

    resource_group_name     = module.resource_group.resource_group_name
    resource_group_location = module.resource_group.resource_group_location

    acr_name = var.acr_name
    acr_sku  = var.acr_sku
}

module "aks" {
    source   = "./modules/aks"

    cluster_name       = var.cluster_name
    dns_prefix         = var.dns_prefix
    admin_username     = var.admin_username
    agent_name         = var.agent_name
    agent_count        = var.agent_count
    agent_vm_size      = var.agent_vm_size
    os_disk_size_gb    = var.os_disk_size_gb
    service_cidr       = var.service_cidr
    dns_service_ip     = var.dns_service_ip
    docker_bridge_cidr = var.docker_bridge_cidr

    resource_group_name     = module.resource_group.resource_group_name
    resource_group_location = module.resource_group.resource_group_location

    public_key_data = module.key_pair.public_key_data
    
    client_id     = module.ad.client_id
    client_secret = module.ad.client_secret

    log_analytics_workspace_id = module.log_analytics.log_analytics_workspace_id
    
    subnet_id = module.networking.subnet_id
}

module "ingress" {
    source = "./modules/ingress"

    cluster_name           = var.cluster_name
    resource_group_name    = module.resource_group.resource_group_name

    client_key             = module.aks.client_key
    client_certificate     = module.aks.client_certificate
    cluster_ca_certificate = module.aks.cluster_ca_certificate
    cluster_username       = module.aks.cluster_username
    cluster_password       = module.aks.cluster_password
    kube_config            = module.aks.kube_config
    host                   = module.aks.host

    chart_name             = var.ingres_chart_name
    chart_version          = var.ingres_chart_version
}

module "prometheus" {
    source = "./modules/prometheus"

    cluster_name           = var.cluster_name
    resource_group_name    = module.resource_group.resource_group_name

    client_key             = module.aks.client_key
    client_certificate     = module.aks.client_certificate
    cluster_ca_certificate = module.aks.cluster_ca_certificate
    cluster_username       = module.aks.cluster_username
    cluster_password       = module.aks.cluster_password
    kube_config            = module.aks.kube_config
    host                   = module.aks.host

    chart_name             = var.prometheus_chart_name
    chart_version          = var.prometheus_chart_version
}
