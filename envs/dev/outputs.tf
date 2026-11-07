output "resource_group" {
  description = "Nom du groupe de ressources"
  value       = azurerm_resource_group.this.name
}

output "vm_private_ip" {
  description = "IP privée de la VM"
  value       = module.vm.private_ip
}