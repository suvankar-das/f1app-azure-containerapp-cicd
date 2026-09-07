resource "azurerm_container_app_environment" "container_app_environment" {
  location                   = azurerm_resource_group.F1_rg_central_india.location
  name                       = "F1-container-app-env${var.env_id}"
  resource_group_name        = azurerm_resource_group.F1_rg_central_india.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.azure_log_analytics_workspace.id


  tags = {
    environment = var.env_id
    src         = var.source_key
  }
}
