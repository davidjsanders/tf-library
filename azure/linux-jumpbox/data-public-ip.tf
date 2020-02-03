data "azurerm_public_ip" "jumpbox-pip-data" {
    resource_group_name = module.jumpbox.rg-name
    name                = azurerm_public_ip.jumpbox-pip.name

    depends_on = [
        module.jumpbox,
        azurerm_public_ip.jumpbox-pip
    ]
}