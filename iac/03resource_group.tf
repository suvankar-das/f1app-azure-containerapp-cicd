resource "azurerm_resource_group" "F1_rg_central_india" {
  name     = "F1_rg_central_india"
  location = "Central India"


  tags = {
    environment = var.env_id
    src = var.source_key
  }
}
