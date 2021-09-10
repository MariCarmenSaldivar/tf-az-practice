output "azurerm_storage_account_identityid" {
    value = azurerm_storage_account.stgfunctionsapp.identity
}

output "storage_account_name" {
    value = azurerm_storage_account.stgfunctionsapp.name
}

output "storage_account_id" {
    value = azurerm_storage_account.stgfunctionsapp.id
}

output "storage_account_key" {
    value = azurerm_storage_account.stgfunctionsapp.primary_access_key
}