resource "azurerm_virtual_network" "vnet" {
    name                = var.vnet_name
    location            = var.resource_group_location
    resource_group_name = var.resource_group_name
    address_space       = var.vnet_cidr_blocks
}

resource "azurerm_subnet" "subnet" {
    name                      = var.subnet_name
    resource_group_name       = var.resource_group_name
    virtual_network_name      = azurerm_virtual_network.vnet.name
    address_prefixes          = var.subnet_cidr_blocks
}

resource "azurerm_network_security_group" "netwoking_security_group" {
    name                = var.nsg_name
    location            = var.resource_group_location
    resource_group_name = var.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "associete_nsg_subnet" {
    subnet_id                 = azurerm_subnet.subnet.id
    network_security_group_id = azurerm_network_security_group.netwoking_security_group.id
}
