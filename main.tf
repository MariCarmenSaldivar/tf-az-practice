
resource "azurerm_resource_group" "doudemo" {
  provider = azurerm
  name     = "rg-${local.pattern_name}"
  location = var.location
}

module "storageaccount" {
  source           = "./modules/storageaccount"
  stname           = replace("stfunc${local.pattern_name}", "-", "")
  rg               = azurerm_resource_group.doudemo.name
  location         = var.location
  tier             = "Standard"
  replication_type = "LRS"
  identity_type    = "SystemAssigned"
}


module "functionserviceplan" {
  source    = "./modules/functionserviceplan"
  plan_name = "plan-${local.pattern_name}"
  location  = var.location
  rg        = azurerm_resource_group.doudemo.name
  kind      = "FunctionApp"
  sku_tier  = "Standard"
  sku_size  = "S1"
}

module "functionappsbackend" {
  for_each = { for funcconf in var.functionsconfig : funcconf.name => funcconf }
  source   = "./modules/azfunctions"

  name     = replace("${each.value.name}${local.pattern_name}", "-", "")
  location = var.location

  rg            = azurerm_resource_group.doudemo.name
  plan_service  = module.functionserviceplan.app_service_plan_azfunctions_id
  stname        = module.storageaccount.storage_account_name
  stkey         = module.storageaccount.storage_account_key
  os_type       = each.value.ostype
  identity_type = "SystemAssigned"
  pkgpath       = each.value.pkgpath
  # identity_ids  =[module.storageaccount.azurerm_storage_account_identityid]
  # storageId    = module.storageaccount.storage_account_id
  # principal_id = module.storageaccount.azurerm_storage_account_identityid[0].principal_id

  depends_on = [
    module.functionserviceplan,
    module.storageaccount
  ]
}

# module "apimanagement" {
#   source = "./modules/apimanagement"

#   apim_name = "dou-apim"
#   location  = var.location
#   rg        = azurerm_resource_group.doudemo.name
#   sku       = "Developer_1"
# }

# resource "azurerm_api_management_backend" "example" {
#   name                = "example-backend"
#   resource_group_name = azurerm_resource_group.doudemo.name
#   api_management_name = "dou-apim"
#   protocol            = "http"
#   url                 = module.apimanagement.azurerm_api_management_gateway_url
# }

