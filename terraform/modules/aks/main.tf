resource "azurerm_kubernetes_cluster" "k8s" {
    name                = var.cluster_name
    location            = var.resource_group_location
    resource_group_name = var.resource_group_name
    dns_prefix          = var.dns_prefix

    linux_profile {
        admin_username = var.admin_username

        ssh_key {
            key_data = var.public_key_data
        }
    }

    default_node_pool {
        name            = var.agent_name
        node_count      = var.agent_count
        vm_size         = var.agent_vm_size
    }

    service_principal {
        client_id     = var.client_id
        client_secret = var.client_secret
    }

    addon_profile {
        oms_agent {
            enabled                    = var.log_analytics_workspace_id != "" ? true : false
            log_analytics_workspace_id = var.log_analytics_workspace_id
        }
    }

    network_profile {
      load_balancer_sku = "Standard"
      network_plugin = "kubenet"
    }

    tags = {
        Environment = "Development"
    }
}
