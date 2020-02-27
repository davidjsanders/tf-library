resource "null_resource" "vm-provisioner" {
    triggers = {
        vm-id          = google_compute_instance.vm.id
        disk-id        = join(",", google_compute_disk.datadisk.*.id)
        disk-attach-id = join(",", google_compute_attached_disk.datadisk-attach.*.id)
    }

    connection {
        host         = google_compute_instance.vm.network_interface.0.access_config.0.nat_ip
        type         = "ssh"
        user         = var.server.admin-user
        private_key  = file(var.server.keyfile)
    }
    provisioner "file" {
        content = templatefile(
            "templates/bootstrap.sh",
            {
                disks = [for d in var.datadisk: {
                    device = format(
                        "/dev/sd%s",
                        substr("bcdefghij", index(var.datadisk, d), 1)
                    ),
                    mountpoint = d.mountpoint
                }]
            }
        )
        destination = "~/bootstrap.sh"
    }

    provisioner "remote-exec" {
        inline = [<<EOF
chmod +x ~/bootstrap.sh
sudo ~/bootstrap.sh
echo "Done.",
EOF
        ]
    }

}