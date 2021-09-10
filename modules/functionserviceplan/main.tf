resource "azurerm_app_service_plan" "azfunctions" {
  name                = var.plan_name
  location            = var.location
  resource_group_name = var.rg
  kind                = var.kind

  sku {
    tier = var.sku_tier
    size = var.sku_size
  }
}