module "k8s-three-tier-network" {
  source = "./azure/3-tier-network/"

  network = {
    address-space   = ["192.168.0.0/23"]
    location        = module.k8s-resource-group.location
    nsg-ids         = [
      module.k8s-nsg-masters.id,
      module.k8s-nsg-workers.id,
      module.k8s-nsg-jumpbox.id
    ]
    rg-name         = module.k8s-resource-group.name
    subnet-prefixes = [
      "192.168.0.0/26",
      "192.168.1.0/24",
      "192.168.0.64/27"
    ]
    subnet-names    = [
      "masters",
      "workers",
      "jumpboxes"
    ]
    vnet-name       = "k8s"
  }
  tags    = var.tags
}
