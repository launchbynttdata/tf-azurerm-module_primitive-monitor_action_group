locals {
  arm_role_receivers = toset(
    flatten([
      for action_group in var.action_groups : [
        for receiver in action_group.arm_role_receivers : receiver
      ]
    ])
  )
  default_tags = {
    provisioner = "terraform"
  }
}
