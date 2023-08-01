output "name" {
  description = "The name of the container registry."
  value       = azurerm_container_registry.acr.name
}

output "id" {
  description = "The id of the container registry."
  value       = azurerm_container_registry.acr.id
}

output "object" {
  description = "The container registry object."
  value       = azurerm_container_registry.acr
}