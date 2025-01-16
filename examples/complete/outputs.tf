output "resource_group_name" {
  description = "Resource group name of the managed action group instance"
  value       = module.resource_group.name
}

output "action_group_name" {
  description = "Resource group name of the managed action group instance"
  value       = module.monitor_action_group.action_group_name
}
