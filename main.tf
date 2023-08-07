resource "azurerm_container_registry" "acr" {
  name                          = var.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  sku                           = var.sku
  public_network_access_enabled = var.public_network_access_enabled

  lifecycle {
    ignore_changes = [tags["CreationDateTime"], tags["Environment"]]
  }
}

locals {
  private_endpoint_subresource = "registry"
}

module "private_dns_zone" {
  source   = "github.com/danielkhen/private_dns_zone_module"
  for_each = var.private_dns_enabled ? [true] : []

  name                = var.dns_name
  resource_group_name = var.resource_group_name
  vnet_links          = var.vnet_links
}

locals {
  private_endpoint_name = "${var.name}-pe"
}

module "hub_acr_private_endpoint" {
  source = "github.com/danielkhen/private_endpoint_module"
  count  = var.private_endpoint_enabled ? 1 : 0

  name                = local.private_endpoint_name
  location            = var.location
  resource_group_name = var.resource_group_name
  private_dns_enabled = var.private_dns_enabled
  private_dns_zone_id = var.private_dns_enabled ? module.private_dns_zone[0].id : null
  log_analytics_id    = var.log_analytics_id

  resource_id      = azurerm_container_registry.acr.id
  subresource_name = local.private_endpoint_subresource
  subnet_id        = var.private_endpoint_subnet_id
}