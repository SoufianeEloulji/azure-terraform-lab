output "vnet_id" {
  description = "ID du réseau virtuel"
  value       = azurerm_virtual_network.this.id
}

output "subnet_id" {
  description = "ID du sous-réseau"
  value       = azurerm_subnet.this.id
}