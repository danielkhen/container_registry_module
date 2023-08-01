<!-- BEGIN_TF_DOCS -->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_name"></a> [dns\_name](#input\_dns\_name) | (Optional) The name of the private dns zone. | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) The location of the container registry. | `string` | n/a | yes |
| <a name="input_log_analytics_id"></a> [log\_analytics\_id](#input\_log\_analytics\_id) | (Required) The id of the log analytics workspace. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the container registry. | `string` | n/a | yes |
| <a name="input_nic_name"></a> [nic\_name](#input\_nic\_name) | (Optional) The name of the network interface of the private endpoint. | `string` | `null` | no |
| <a name="input_private_dns_enabled"></a> [private\_dns\_enabled](#input\_private\_dns\_enabled) | (Optional) Should the private endpoint be attached to a private dns zone. | `bool` | `false` | no |
| <a name="input_private_endpoint_enabled"></a> [private\_endpoint\_enabled](#input\_private\_endpoint\_enabled) | (Optional) Should the container registry have a private endpoint. | `bool` | `false` | no |
| <a name="input_private_endpoint_name"></a> [private\_endpoint\_name](#input\_private\_endpoint\_name) | (Optional) The name of the private endpoint. | `string` | `null` | no |
| <a name="input_private_endpoint_subnet_id"></a> [private\_endpoint\_subnet\_id](#input\_private\_endpoint\_subnet\_id) | (Optional) The subnet id of the private endpoint. | `string` | `false` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | (Optional) Should the acr have public network access. | `bool` | `false` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The resource group name of the container registry. | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | (Required) The SKU of the container registry. | `string` | n/a | yes |
| <a name="input_vnet_links"></a> [vnet\_links](#input\_vnet\_links) | (Optional) A list of virtual networks to link with the private dns zone. | <pre>list(object({<br>    name    = string<br>    vnet_id = string<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The id of the container registry. |
| <a name="output_name"></a> [name](#output\_name) | The name of the container registry. |
| <a name="output_object"></a> [object](#output\_object) | The container registry object. |

## Resources

| Name | Type |
|------|------|
| [azurerm_container_registry.acr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_hub_acr_private_endpoint"></a> [hub\_acr\_private\_endpoint](#module\_hub\_acr\_private\_endpoint) | github.com/danielkhen/private_endpoint_module | n/a |

## Example Code

```hcl
module "acr" {
  source = "github.com/danielkhen/container_registry_module"

  name                          = "exampleacr"
  resource_group_name           = azurerm_resource_group.example.name
  location                      = "westeurope"
  sku                           = "Basic"
  public_network_access_enabled = true
  log_analytics_id              = azurerm_log_analytics_workspace.example.id
}
```
<!-- END_TF_DOCS -->