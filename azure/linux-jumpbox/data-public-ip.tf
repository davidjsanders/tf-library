data "azurerm_public_ip" "jumpbox-pip-data" {
    resource_group_name = module.linux-server.rg-name
    name                = azurerm_public_ip.jumpbox-pip.name

    depends_on = [
        module.linux-server,
        azurerm_public_ip.jumpbox-pip
    ]
}