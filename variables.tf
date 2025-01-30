variable "action_group_name" {
  description = "Specifies the Name of the action group."
  type        = string
}

variable "resource_group_name" {
  description = <<EOT
    Specifies the Name of the Resource Group within which the Private Endpoint should exist.
    Changing this forces a new resource to be created.
  EOT
  type        = string
}

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
