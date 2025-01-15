// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

data "azurerm_role_definition" "builtin" {
  for_each = local.arm_role_receivers

  name = each.key
}

resource "azurerm_monitor_action_group" "monitor_action_group" {
  for_each = var.action_groups != null ? var.action_groups : {}

  name                = var.action_group_name
  resource_group_name = var.resource_group_name
  short_name          = each.key
  tags                = merge(local.default_tags, var.tags)

  dynamic "arm_role_receiver" {
    for_each = each.value.arm_role_receivers != null ? each.value.arm_role_receivers : toset([])
    content {
      name = arm_role_receiver.key
      role_id = replace(
        data.azurerm_role_definition.builtin[arm_role_receiver.key].role_definition_id,
        "/\\/.*\\//",
        ""
      )
      use_common_alert_schema = true
    }
  }
  dynamic "email_receiver" {
    for_each = each.value.email_receivers != null ? each.value.email_receivers : toset([])
    content {
      name                    = each.value.email_receivers.email_receiver_name
      email_address           = each.value.email_receivers.email_address
      use_common_alert_schema = true
    }
  }
}
