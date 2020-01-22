resource "azurerm_subnet_network_security_group_association" "k8s-nsg-assoc-1" {
  subnet_id                 = module.k8s-three-tier-network.subnet-ids[0]
  network_security_group_id = module.k8s-nsg-masters.id
}

resource "azurerm_subnet_network_security_group_association" "k8s-nsg-assoc-2" {
  subnet_id                 = module.k8s-three-tier-network.subnet-ids[1]
  network_security_group_id = module.k8s-nsg-workers.id
}

resource "azurerm_subnet_network_security_group_association" "k8s-nsg-assoc-3" {
  subnet_id                 = module.k8s-three-tier-network.subnet-ids[2]
  network_security_group_id = module.k8s-nsg-jumpbox.id
}
