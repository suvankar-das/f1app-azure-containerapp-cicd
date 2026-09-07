resource "azurerm_container_registry" "azure_container_registry" {
  location = azurerm_resource_group.F1_rg_central_india.location
  name = "f1azurecontainerregistry${var.env_id}"
  resource_group_name = azurerm_resource_group.F1_rg_central_india.name
  sku = "Standard"


  # to make sure the container is accessible from github actions, we need to enable the admin user
  admin_enabled = true
  public_network_access_enabled = true

  tags = {
    environment = var.env_id
    src = var.source_key
  }
}
