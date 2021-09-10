resource "azurerm_storage_account" "stgfunctionsapp" {
  name                     = var.stname
  resource_group_name      = var.rg
  location                 = var.location
  account_tier             = var.tier
  account_replication_type = var.replication_type
  identity {
    type = var.identity_type
  }
  #   tags = {
  #     environment = "staging"
  #   }
}