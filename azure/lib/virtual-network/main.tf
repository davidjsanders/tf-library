resource "azurerm_virtual_network" "vnet" {
  address_space       = var.vnet.address-space
  location            = var.vnet.location
  name                = upper(
    format(
      "VNET-%s",
      var.vnet.vnet-name
    ),
  )
  resource_group_name = var.vnet.rg-name
  tags                = var.tags
}

