resource "azurerm_mssql_server" "F1_rg_central_india_sql_server" {
  location                     = azurerm_resource_group.F1_rg_central_india.location
  name                         = "formulaone-sqlserver-${var.env_id}"
  resource_group_name          = azurerm_resource_group.F1_rg_central_india.name
  version                      = "12.0"
  administrator_login          = var.sql_username
  administrator_login_password = var.sql_pass


  tags = {
    environment = var.env_id
    src         = var.source_key
  }
}



# create a database
resource "azurerm_mssql_database" "F1_rg_central_india_sql_db" {
  name           = "formulaone-db"
  server_id      = azurerm_mssql_server.F1_rg_central_india_sql_server.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 10
  sku_name       = "S1"
  zone_redundant = false

  lifecycle {
    prevent_destroy = false
  }
  tags = {
    environment = var.env_id
    src         = var.source_key
  }
}


# allowing resources like  Container App to connect to the SQL Server.
resource "azurerm_mssql_firewall_rule" "F1_rg_central_india_sql_server_firewall_rule" {
  end_ip_address   = "0.0.0.0"
  name             = "all_azure"
  server_id        = azurerm_mssql_server.F1_rg_central_india_sql_server.id
  start_ip_address = "0.0.0.0"
}
