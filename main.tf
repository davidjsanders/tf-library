provider "azurerm" {
  version = ">=1.34.0"
  client_id       = var.azure-secrets.client-id
  client_secret   = var.azure-secrets.client-secret
  tenant_id       = var.azure-secrets.tenant-id
  subscription_id = var.azure-secrets.subscription-id
}
provider "random" {
  version = ">=2.2.0"
}
provider "template" {
  version = ">=2.1.2"
}
provider "null" {
  version = ">=2.1.2"
}
