output "ids" {
  value = azurerm_virtual_machine.vm.*.id
}
output "names" {
  value = azurerm_virtual_machine.vm.*.name
}