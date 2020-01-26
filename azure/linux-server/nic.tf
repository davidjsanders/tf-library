module "linux-server-nic" {
  source = "../lib/network-interface/"
  nic = {
    allocation = "Dynamic"
    ip-address = ""
    location   = var.linux-server.location
    nic-count  = var.linux-server.server-count
    nic-name   = var.linux-server.server-name
    pip-id     = var.linux-server.pip-id
    randomizer = var.linux-server.randomizer
    rg-name    = var.linux-server.rg-name
    subnet-id  = var.linux-server.subnet-id
  }
  tags = var.tags
}
