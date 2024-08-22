output "name" {
  description = "The name of the newly created Vm."
  value       = azurerm_windows_virtual_machine.windows_vm.name
}


output "id" {
  description = "The Id of the newly created Vm."
  value       = azurerm_windows_virtual_machine.windows_vm.id
}
