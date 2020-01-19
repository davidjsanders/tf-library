module "test-pip" {
  source = "./public-ip/"
  pip = {
    allocation-method = "Dynamic"
    domain-name-label = ""
    ip-version        = "IPv4"
    location          = module.test-resource-group.location
    pip-count         = 1
    pip-name          = "djs-test"
    rg-name           = module.test-resource-group.name
    sku               = "Basic"
  }
  tags = var.tags
}
