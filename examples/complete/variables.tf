variable "action_group_name" {
  description = "Specifies the Name of the action group."
  type        = string
}

# variable "resource_group_name" {
#   description = <<EOT
#     Specifies the Name of the Resource Group within which the Private Endpoint should exist.
#     Changing this forces a new resource to be created.
#   EOT
#   type        = string
# }

variable "short_name" {
  description = "The short name of the action group."
  type        = string
}

variable "arm_role_receivers" {
  description = <<EOT
  List of ARM role receivers. Each entry should have:
  - name (string): The name of the ARM role receiver.
  - role_id (string): The ARM role ID.
  - use_common_alert_schema (bool, optional): Whether to use the common alert schema.
  EOT
  type = list(object({
    name                    = string
    role_id                 = string
    use_common_alert_schema = optional(bool)
  }))
  default = []
}

variable "email_receivers" {
  description = <<EOT
  List of email receivers. Each entry should have:
  - name (string): The name of the ARM role receiver.
  - email_address (string): The email address to receive alerts.
  - use_common_alert_schema (bool, optional): Whether to use the common alert schema.
  EOT
  type = list(object({
    name                    = string
    email_address           = string
    use_common_alert_schema = optional(bool)
  }))
  default = []
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}


variable "resource_names_map" {
  description = "A map of key to resource_name that will be used by tf-launch-module_library-resource_name to generate resource names"
  type = map(object({
    name       = string
    max_length = optional(number, 60)
  }))

  default = {
    resource_group = {
      name       = "rg"
      max_length = 80
    }
  }
}

variable "region" {
  type        = string
  description = <<EOF
    (Required) The location where the resource will be created. Must not have spaces
    For example, eastus, westus, centralus etc.
  EOF
  nullable    = false
  default     = "eastus2"

  validation {
    condition     = length(regexall("\\b \\b", var.region)) == 0
    error_message = "Spaces between the words are not allowed."
  }
}

variable "class_env" {
  type        = string
  description = "(Required) Environment where resource is going to be deployed. For example. dev, qa, uat"
  nullable    = false
  default     = "dev"

  validation {
    condition     = length(regexall("\\b \\b", var.class_env)) == 0
    error_message = "Spaces between the words are not allowed."
  }
}

variable "instance_env" {
  type        = number
  description = "Number that represents the instance of the environment."
  default     = 0

  validation {
    condition     = var.instance_env >= 0 && var.instance_env <= 999
    error_message = "Instance number should be between 0 to 999."
  }
}

variable "instance_resource" {
  type        = number
  description = "Number that represents the instance of the resource."
  default     = 0

  validation {
    condition     = var.instance_resource >= 0 && var.instance_resource <= 100
    error_message = "Instance number should be between 0 to 100."
  }
}

variable "logical_product_family" {
  type        = string
  description = <<EOF
    (Required) Name of the product family for which the resource is created.
    Example: org_name, department_name.
  EOF
  nullable    = false
  default     = "launch"

  validation {
    condition     = can(regex("^[_\\-A-Za-z0-9]+$", var.logical_product_family))
    error_message = "The variable must contain letters, numbers, -, _, and .."
  }
}

variable "location" {
  description = "target resource group resource mask"
  type        = string
  default     = "eastus"
}


variable "logical_product_service" {
  type        = string
  description = <<EOF
    (Required) Name of the product service for which the resource is created.
    For example, backend, frontend, middleware etc.
  EOF
  nullable    = false
  default     = "network"

  validation {
    condition     = can(regex("^[_\\-A-Za-z0-9]+$", var.logical_product_service))
    error_message = "The variable must contain letters, numbers, -, _, and .."
  }
}
