output "vm_id" {
  description = "ID de la VM"
  value       = azurerm_linux_virtual_machine.this.id
}

output "private_ip" {
  description = "Adresse IP privée de la VM"
  value       = azurerm_network_interface.this.private_ip_address
}

output "disable_password_authentication" {
  description = "Indique si la connexion par mot de passe est désactivé"
  value       = azurerm_linux_virtual_machine.this.disable_password_authentication
}