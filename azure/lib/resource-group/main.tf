resource "azurerm_resource_group" "rg" {
  name     = upper(
    format(
      "RG-%s%s",
      var.rg.rg-name,
      var.rg.randomizer
    )
  )
  location = var.rg.location
  tags     = var.tags
}
