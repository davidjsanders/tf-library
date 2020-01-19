resource "azurerm_public_ip" "pip" {
  count = var.pip.pip-count

  allocation_method = var.pip.allocation-method
  location          = var.pip.location
  name = upper(
    format(
      "PIP-%s-%02d",
      var.pip.pip-name,
      count.index + 1
    )
  )
  resource_group_name = var.pip.rg-name
  sku                 = var.pip.sku

  tags = var.tags
}
