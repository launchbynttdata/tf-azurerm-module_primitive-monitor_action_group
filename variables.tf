# variable "action_groups" {
#   type = map(object({
#     name                = string
#     resource_group_name = string
#     arm_role_receivers = map(object({
#       arm_role_receiver_name  = string
#       role_id                 = string
#       use_common_alert_schema = bool
#     }))
#     email_receivers = optional(map(object({
#       email_receiver_name     = string
#       email_address           = string
#       use_common_alert_schema = bool
#     })))
#   }))
#   default = {}
# }

variable "action_groups" {
  type = map(object({
    arm_role_receivers = optional(set(string))
    email_receivers    = optional(set(string))
  }))
  default = {}
}

variable "action_group_name" {
  description = "Specifies the Name of the action group. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = <<EOT
    Specifies the Name of the Resource Group within which the Private Endpoint should exist.
    Changing this forces a new resource to be created.
  EOT
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
