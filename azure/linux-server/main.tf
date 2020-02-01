resource "azurerm_virtual_machine" "vm" {
  count = var.linux-server.server.server-count

  resource_group_name              = var.linux-server.rg-name
  vm_size                          = var.linux-server.server.machine-size
  availability_set_id              = var.linux-server.server.availability-set-id
  delete_os_disk_on_termination    = var.linux-server.os-disk.delete-on-done
  delete_data_disks_on_termination = false
  location                         = var.linux-server.location

  name = upper(
    format(
      "VM-%s-%02d%s",
      upper(var.linux-server.os.server-name),
      count.index + 1,
      var.linux-server.randomizer
    ),
  )

  network_interface_ids = [azurerm_network_interface.nic.*.id[count.index]]

  boot_diagnostics {
    storage_uri = var.linux-server.boot-diagnostics.uri
    enabled     = var.linux-server.boot-diagnostics.enable
  }

  storage_image_reference {
    id = var.linux-server.os.storage-image-reference
  }

  storage_os_disk {
    name              = upper(
      format(
        "DSK-%s-%02d%s",
        var.linux-server.os.server-name,
        count.index + 1,
        var.linux-server.randomizer
      )
    )
    caching           = var.linux-server.os-disk.caching
    create_option     = var.linux-server.os-disk.create-option
    managed_disk_type = var.linux-server.os-disk.managed-type
  }

  os_profile {
    computer_name = lower(
      format(
        "%s-%02d%s",
        lower(var.linux-server.os.server-name),
        count.index + 1,
        var.linux-server.randomizer
      ),
    )
    admin_username = var.linux-server.os.admin-user
    admin_password = random_password.password.result
    custom_data    = var.linux-server.os.custom-data
  }

  os_profile_linux_config {
    disable_password_authentication = var.linux-server.os.disable-password-auth

    ssh_keys {
      path     = "/home/${var.linux-server.os.admin-user}/.ssh/authorized_keys"
      key_data = var.linux-server.os.public-key
    }
  }

  tags = var.tags
}
