module "acr" {
  source = "github.com/danielkhen/container_registry_module"

  name                          = "exampleacr"
  resource_group_name           = azurerm_resource_group.example.name
  location                      = "westeurope"
  sku                           = "Basic"
  public_network_access_enabled = true
  log_analytics_id              = azurerm_log_analytics_workspace.example.id
}
