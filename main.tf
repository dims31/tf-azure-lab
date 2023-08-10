resource "azuread_user" "users" {
  for_each            = var.users
  user_principal_name = each.value
  display_name        = each.key
  password            = var.password
}

resource "azurerm_resource_group" "rg" {
  for_each = var.users
  name     = "${each.key}-rg"
  location = "West Europe"
}

resource "azurerm_role_assignment" "role_ass" {
  for_each             = azurerm_resource_group.rg
  scope                = each.value.id
  role_definition_name = "Owner"
  principal_id         = azuread_user.users[each.key].object_id
}