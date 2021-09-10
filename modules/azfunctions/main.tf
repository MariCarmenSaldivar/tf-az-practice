resource "azurerm_function_app" "functiondou" {
  name                       = var.name
  location                   = var.location
  resource_group_name        = var.rg
  app_service_plan_id        = var.plan_service
  storage_account_name       = var.stname
  storage_account_access_key = var.stkey
  version = "~2"
  #   storage_account_access_key = azurerm_storage_account.example.primary_access_key
  os_type = var.os_type
  identity {
    type = var.identity_type
    # identity_ids = [var.identity_ids]
  }
  #Should be the last resource! 
  provisioner "local-exec" {
    command = "az functionapp deployment source config-zip -g ${var.rg} -n ${var.name} --src ${var.pkgpath}"
  }
}

# resource "azurerm_role_assignment" "example" {
#   scope                = var.storageId
#   principal_id         = var.principal_id
#   role_definition_name = "Contributor"

# }