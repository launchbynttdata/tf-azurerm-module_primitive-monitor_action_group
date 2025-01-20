action_group_name   = "test-action-group"
resource_group_name = module.resource_group.name
short_name          = "testtag"

arm_role_receivers = [{
  name                    = "example-arm-role"
  role_id                 = "some-role-id"
  use_common_alert_schema = true
}]

email_receivers = [{
  name                    = "example-email"
  email_address           = "example@test.com"
  use_common_alert_schema = true
}]
