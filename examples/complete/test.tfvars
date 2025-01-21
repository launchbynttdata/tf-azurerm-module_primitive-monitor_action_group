action_group_name   = "test-action-group"
resource_group_name = module.resource_group.name
short_name          = "testtag"

arm_role_receivers = [{
  name                    = "example-arm-role"
  role_id                 = "b24988ac-6180-42a0-ab88-20f7382dd24c"
  use_common_alert_schema = true
}]

email_receivers = [{
  name                    = "example-email"
  email_address           = "example@test.com"
  use_common_alert_schema = true
}]
