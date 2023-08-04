resource "azurerm_role_definition" "custom_role" {
  name        = var.custom_role_definition.name
  scope       = var.custom_role_definition.scope
  description = var.custom_role_definition.description

  permissions {
    actions          = lookup(var.custom_role_definition.permissions, "actions", [])
    data_actions     = lookup(var.custom_role_definition.permissions, "dataActions", [])
    not_actions      = lookup(var.custom_role_definition.permissions, "notActions", [])
    not_data_actions = lookup(var.custom_role_definition.permissions, "notDataActions", [])
  }
  assignable_scopes = lookup(var.custom_role_definition, "assignable_scopes", [])
}
