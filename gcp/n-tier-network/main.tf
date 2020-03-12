resource "google_compute_network" "vnet" {
  name                    = var.network-info.network-name
  auto_create_subnetworks = var.network-info.auto-create-subnets
}