resource "google_compute_subnetwork" "subnets" {
  count = length(var.network-info.subnets)

  name          = var.network-info.subnets[count.index].subnet-name
  ip_cidr_range = var.network-info.subnets[count.index].cidr-block
  region        = var.network-info.subnets[count.index].subnet-name
  network       = google_compute_network.vnet.self_link
}
