# action_groups = {
#   test_group_1 = {
#     name = "TestActionGroup1"
#     arm_role_receivers = {
#       test_receiver_1 = {
#         name = "TestReceiver1"
#         role_id =
#         use_common_alert_schema = true
#       }
#     }
#   }

# }

action_groups = {
  "test_group_1" = {
    name                = "TestReceiver1"
    arm_role_receivers  = ["Owner"]
    resource_group_name = "test-resource-group"
  }
}
