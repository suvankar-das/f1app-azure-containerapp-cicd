resource "azurerm_log_analytics_workspace" "azure_log_analytics_workspace" {
  name                = "F1-log-analytics-workspace${var.env_id}"
  location            = azurerm_resource_group.F1_rg_central_india.location
  resource_group_name = azurerm_resource_group.F1_rg_central_india.name
  sku                 = "PerGB2018" #what tier
  retention_in_days   = 30 # how long to keep the logs for

  tags = {
    environment = var.env_id
    src         = var.source_key
  }
}
