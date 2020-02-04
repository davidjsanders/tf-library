resource "null_resource" "provisioner" {
    depends_on = [azurerm_public_ip.jumpbox-pip-data]

    connection {
        host         = azurerm_public_ip.jumpbox-pip-data.ip_address
        type         = "ssh"
        user         = var.linux-jumpbox.os.admin-user
        private_key  = file(var.linux-jumpbox.os.private-key-filename)
    }

    provisioner "file" {
        source      = var.linux-jumpbox.os.private-key-filename
        destination = format(
            "/home/%s/.ssh/azure-pk",
            var.linux-jumpbox.os.admin-user
        )
    }

    provisioner "remote-exec" {
        inline = [
            "chmod 0600 ~/.ssh/azure-pk",
            "echo 'Done.'",
        ]
    }

}
