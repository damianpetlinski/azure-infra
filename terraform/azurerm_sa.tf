resource "azurerm_storage_account" "main" {
  name                     = lower("${var.prefix}${var.environment}sa")
  location                 = var.location
  resource_group_name      = azurerm_resource_group.main.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}