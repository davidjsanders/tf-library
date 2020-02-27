resource "google_compute_disk" "datadisk" {
    count = length(var.datadisk)

    labels                    = var.labels
    name                      = format(
        "%s-%s",
        var.datadisk[count.index].disk-name,
        random_id.instance-id.hex
    )
    physical_block_size_bytes = var.datadisk[count.index].block_size_bytes
    size                      = var.datadisk[count.index].disk-size-in-gb
    type                      = var.datadisk[count.index].disk-type
    zone                      = var.datadisk[count.index].zone
}
