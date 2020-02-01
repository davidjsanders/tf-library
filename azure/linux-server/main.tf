resource "azurerm_virtual_machine" "vm" {
  count = var.linux-server.server-count

  resource_group_name              = var.linux-server.rg-name
  vm_size                          = var.linux-server.machine-size
  availability_set_id              = var.linux-server.availability-set-id
  delete_os_disk_on_termination    = var.linux-server.os-disk.delete-on-done
  delete_data_disks_on_termination = var.linux-server.delete-data-on-done
  location                         = var.linux-server.location

  name = upper(
    format(
      "VM-%s-%02d%s",
      upper(var.linux-server.server-name),
      count.index + 1,
      var.linux-server.randomizer
    ),
  )

  network_interface_ids = [azurerm_network_interface.nic.*.id[count.index]]

  boot_diagnostics {
    storage_uri = var.linux-server.boot-diags-sa-uri
    enabled     = var.linux-server.boot-diags
  }

  storage_image_reference {
    id = var.linux-server.storage-image-reference
  }

  storage_os_disk {
    name              = upper(
      format(
        "DSK-%s-%02d%s",
        var.linux-server.server-name,
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
        lower(var.linux-server.server-name),
        count.index + 1,
        var.linux-server.randomizer
      ),
    )
    admin_username = var.linux-server.admin-user
    admin_password = random_password.password.result
    custom_data    = var.linux-server.custom-data
  }

  os_profile_linux_config {
    disable_password_authentication = var.linux-server.disable-password-auth

    ssh_keys {
      path     = "/home/${var.linux-server.admin-user}/.ssh/authorized_keys"
      key_data = var.linux-server.public-key
    }
  }

  tags = var.tags
}




# module "linux-server-vm" {
#   source         = "../lib/virtual-machine/"

#   tags           = var.tags
#   vm             = {
#     admin-user              = var.linux-server.admin-user
#     admin-password          = random_password.password.result
#     avset-id                = var.linux-server.availability-set-id
#     boot-diags              = var.linux-server.boot-diags
#     boot-sa-uri             = var.linux-server.boot-diags-sa-uri
#     custom-data             = var.linux-server.custom-data
#     disable-password-auth   = true
#     location                = var.linux-server.location
#     name-prefix             = var.linux-server.server-name
#     network-interfaces      = module.linux-server-nic.ids
#     public-key              = var.linux-server.public-key
#     randomizer              = var.linux-server.randomizer
#     rg-name                 = var.linux-server.rg-name
#     size                    = var.linux-server.machine-size
#     storage-image-reference = var.linux-server.storage-image-reference
#     vm-count                = 1
#   }
#   vm-os-disk     = {
#     disk-name           = var.linux-server.server-name
#     caching             = "ReadWrite"
#     create-option       = "FromImage"
#     disk-type           = "Premium_LRS"
#     delete-on-terminate = true
#   }
#   vm-data-disk   = {
#     disk-count          = 0
#     disk-prefix         = var.linux-server.server-name
#     caching             = "ReadWrite"
#     create-option       = "Empty"
#     disk-type           = "Premium_LRS"
#     disk-size-gb        = 50
#     delete-on-terminate = true
#   }
# }
