resource "random_id" "log_analytics_workspace_name_suffix" {
    byte_length = 8
}

resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
    name                = "${var.log_analytics_workspace_name}-${random_id.log_analytics_workspace_name_suffix.dec}"
    location            = var.resource_group_location
    resource_group_name = var.resource_group_name
    sku                 = var.log_analytics_workspace_sku
}

resource "azurerm_log_analytics_solution" "log_analytics_solution" {
    solution_name         = "ContainerInsights"
    location              = var.resource_group_location
    resource_group_name   = var.resource_group_name
    workspace_resource_id = azurerm_log_analytics_workspace.log_analytics_workspace.id
    workspace_name        = azurerm_log_analytics_workspace.log_analytics_workspace.name

    plan {
        publisher = "Microsoft"
        product   = "OMSGallery/ContainerInsights"
    }
}
