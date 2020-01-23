resource "azurerm_virtual_network" "vnet" {
  address_space       = var.vnet.address-space
  location            = var.vnet.location
  name                = upper(
    format(
      "VNT-%s%s",
      var.vnet.vnet-name,
      var.vnet.randomizer
    ),
  )
  resource_group_name = var.vnet.rg-name
  tags                = var.tags
}

