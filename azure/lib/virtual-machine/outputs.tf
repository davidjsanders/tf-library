output "ids" {
  value = azurerm_virtual_machine.vm.*.id
}
output "names" {
  value = azurerm_virtual_machine.vm.*.name
}
output "rg-names" {
  value = azurerm_virtual_machine.vm.*.resource_group_name
}