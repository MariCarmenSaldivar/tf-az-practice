resource "azurerm_api_management" "apim" {
  name                = var.apim_name
  location            = var.location
  resource_group_name = var.rg
  publisher_name      = "Carmen Compamy"
  publisher_email     = "carmen.saldivar@digitalonus.com"

  sku_name = var.sku
}