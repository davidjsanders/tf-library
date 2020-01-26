resource "azurerm_public_ip" "pip" {
  count = var.pip.pip-count

  allocation_method = var.pip.allocation-method
  domain_name_label = var.pip.domain-name-label
  location          = var.pip.location
  name              = upper(
    format(
      "PIP-%s-%02d%s",
      var.pip.pip-name,
      count.index + 1,
      var.pip.randomizer
    )
  )
  resource_group_name = var.pip.rg-name
  sku                 = var.pip.sku

  tags = var.tags
}
