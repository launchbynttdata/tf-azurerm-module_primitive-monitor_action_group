# tf-azurerm-module_primitive-monitor_action_group
# tf-azurerm-module_reference-monitoring
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 3.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.77 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.117.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_action_group.monitor_action_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_action_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_group_name"></a> [action\_group\_name](#input\_action\_group\_name) | Specifies the Name of the action group. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Specifies the Name of the Resource Group within which the Private Endpoint should exist.<br>    Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_short_name"></a> [short\_name](#input\_short\_name) | The short name of the action group. | `string` | n/a | yes |
| <a name="input_arm_role_receivers"></a> [arm\_role\_receivers](#input\_arm\_role\_receivers) | List of ARM role receivers. Each entry should have:<br>  - name (string): The name of the ARM role receiver.<br>  - role\_id (string): The ARM role ID.<br>  - use\_common\_alert\_schema (bool, optional): Whether to use the common alert schema. | <pre>list(object({<br>    name                    = string<br>    role_id                 = string<br>    use_common_alert_schema = optional(bool)<br>  }))</pre> | `[]` | no |
| <a name="input_email_receivers"></a> [email\_receivers](#input\_email\_receivers) | List of email receivers. Each entry should have:<br>  - name (string): The name of the ARM role receiver.<br>  - email\_address (string): The email address to receive alerts.<br>  - use\_common\_alert\_schema (bool, optional): Whether to use the common alert schema. | <pre>list(object({<br>    name                    = string<br>    email_address           = string<br>    use_common_alert_schema = optional(bool)<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_action_group_id"></a> [action\_group\_id](#output\_action\_group\_id) | The ID value that was allocated. |
| <a name="output_action_group_name"></a> [action\_group\_name](#output\_action\_group\_name) | The name value that was allocated. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
