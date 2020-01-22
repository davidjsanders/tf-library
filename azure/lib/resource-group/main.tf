resource "azurerm_resource_group" "rg" {
  name     = upper(
    format(
      "RG-%s",
      var.rg.rg-name
    )
  )
  location = var.rg.location
  tags     = var.tags
}
