resource "azurerm_resource_group" "rg" {
  name     = var.rg.rg-name
  location = var.rg.location
  tags     = var.tags
}
