# tf-azurerm-module_primitive-monitor_action_group

## Overview

This module creates an Azure Monitor Action Group and supports ARM role and email receivers.

## Usage

```hcl
module "monitor_action_group" {
	source = "terraform.registry.launch.nttdata.com/module_primitive/monitor_action_group/azurerm"

	action_group_name    = "example-action-group"
	short_name           = "exag"
	resource_group_name  = "example-rg"

	email_receivers = [
		{
			name          = "platform-oncall"
			email_address = "platform-oncall@example.com"
		}
	]
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.77, < 5.0 |

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
| <a name="input_arm_role_receivers"></a> [arm\_role\_receivers](#input\_arm\_role\_receivers) | List of ARM role receivers. Each entry should have:<br/>  - name (string): The name of the ARM role receiver.<br/>  - role\_id (string): The ARM role ID.<br/>  - use\_common\_alert\_schema (bool, optional): Whether to use the common alert schema. | <pre>list(object({<br/>    name                    = string<br/>    role_id                 = string<br/>    use_common_alert_schema = optional(bool)<br/>  }))</pre> | `[]` | no |
| <a name="input_email_receivers"></a> [email\_receivers](#input\_email\_receivers) | List of email receivers. Each entry should have:<br/>  - name (string): The name of the ARM role receiver.<br/>  - email\_address (string): The email address to receive alerts.<br/>  - use\_common\_alert\_schema (bool, optional): Whether to use the common alert schema. | <pre>list(object({<br/>    name                    = string<br/>    email_address           = string<br/>    use_common_alert_schema = optional(bool)<br/>  }))</pre> | `[]` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Specifies the Name of the Resource Group within which the Private Endpoint should exist.<br/>    Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_short_name"></a> [short\_name](#input\_short\_name) | The short name of the action group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_action_group_id"></a> [action\_group\_id](#output\_action\_group\_id) | The ID value that was allocated. |
| <a name="output_action_group_name"></a> [action\_group\_name](#output\_action\_group\_name) | The name value that was allocated. |
<!-- END_TF_DOCS -->

## Module Development

Use this repository as a standard Launch Terraform primitive module.

- Keep examples and tests aligned with code changes because they are part of the public contract.
- Preserve generated files and automation patterns from the shared skeleton unless a module-specific exception is required.
- Prefer make targets and pre-commit hooks over ad hoc commands to match CI behavior.

## Pre-Requisites

The following commands should be available on your system:

- asdf or mise
- make
- python3 (for pre-commit)

Install pinned tool versions and bootstrap dependencies from the repository root:

```sh
make configure
```

For Azure-backed tests, set environment variables using:

```sh
make env
```

## Pre-Commit Hooks

This repository uses [.pre-commit-config.yaml](.pre-commit-config.yaml) to run Terraform, Go, and repository hygiene checks.

Install local hooks:

```sh
pre-commit install --hook-type commit-msg
```

Run all hooks manually:

```sh
pre-commit run --all-files
```

## Local Validation

Run the same validations used in CI:

```sh
make lint
make check
```

If a hook or generated file changes content (for example terraform-docs), commit the updates and rerun the checks.

## Review And Merge Process

- Open a pull request with a clear summary of functional and test-impacting changes.
- Resolve all review comments and ensure CI is green before merge.
- Keep commits focused and use conventional commit messages when possible.

## Automatic Updates

This repository receives periodic updates from the shared launch-terraform-skeleton baseline via Copier automation. Keep skeleton-managed files aligned with upstream expectations so automated updates continue to merge cleanly.
