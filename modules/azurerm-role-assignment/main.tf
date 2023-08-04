resource "azurerm_role_assignment" "role_assignment" {
    for_each = local.principal_ids
    
    scope                            = var.scope_id
    role_definition_name             = var.role_definition_name
    principal_id                     = each.key
}

