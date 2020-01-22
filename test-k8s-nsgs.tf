module "k8s-nsg-masters" {
  source = "./azure/lib/nsg/"
  nsg = {
    location = module.k8s-resource-group.location
    nsg-name = format(
      "tier-1-%s",
      var.jumpbox.jumpbox-name
    )
    rg-name  = module.k8s-resource-group.name
  }
  tags = var.tags
}

module "k8s-nsg-workers" {
  source = "./azure/lib/nsg/"
  nsg = {
    location = module.k8s-resource-group.location
    nsg-name = format(
      "tier-2-%s",
      var.jumpbox.jumpbox-name
    )
    rg-name  = module.k8s-resource-group.name
  }
  tags = var.tags
}

module "k8s-nsg-jumpbox" {
  source = "./azure/lib/nsg/"
  nsg = {
    location = module.k8s-resource-group.location
    nsg-name = format(
      "tier-3-%s",
      var.jumpbox.jumpbox-name
    )
    rg-name  = module.k8s-resource-group.name
  }
  tags = var.tags
}
