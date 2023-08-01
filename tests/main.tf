locals {
  location            = "westeurope"
  resource_group_name = "dtf-container-registry-test"
}

resource "azurerm_resource_group" "test_rg" {
  name     = local.resource_group_name
  location = local.location

  lifecycle {
    ignore_changes = [tags["CreationDateTime"], tags["Environment"]]
  }
}

locals {
  activity_log_analytics_name           = "activity-monitor-log-workspace"
  activity_log_analytics_resource_group = "dor-hub-n-spoke"
}

data "azurerm_log_analytics_workspace" "activity" {
  name                = local.activity_log_analytics_name
  resource_group_name = local.activity_log_analytics_resource_group
}

locals {
  acr_name                          = "dtftestacr"
  acr_sku                           = "Basic"
  acr_public_network_access_enabled = true
}


module "acr" {
  source = "../"

  name                          = local.acr_name
  resource_group_name           = azurerm_resource_group.test_rg.name
  location                      = local.location
  log_analytics_id              = data.azurerm_log_analytics_workspace.activity.id
  sku                           = local.acr_sku
  public_network_access_enabled = local.acr_public_network_access_enabled
}
