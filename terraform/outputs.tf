output "vm_ip" {
  value = azurerm_linux_virtual_machine.main.public_ip_address
}

output "ssh_command" {
  value = "ssh azureuser@${azurerm_linux_virtual_machine.main.public_ip_address}"
}
