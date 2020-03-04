resource "google_compute_attached_disk" "datadisk-attach" {
    count = length(var.datadisk)
    depends_on = [
        google_compute_disk.datadisk,
        google_compute_instance.vm
    ]

    disk     = google_compute_disk.datadisk.*.self_link[count.index]
    instance = google_compute_instance.vm.self_link
}