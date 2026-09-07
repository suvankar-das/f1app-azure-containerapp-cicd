resource "azurerm_container_app" "F1_azure_container_app_central_india" {
  name                = "f1-azure-container-app-cen-india"
  template {
    min_replicas = 1
    max_replicas = 3
    container {
      name   = "f1-container-central-india"
      image  = "mcr.microsoft.com/k8se/quickstart:latest" #default image for the container app
      cpu    = "0.25"
      memory = "0.5Gi"
    }
  }
  revision_mode      = "Multiple"
  resource_group_name = azurerm_resource_group.F1_rg_central_india.name
  container_app_environment_id = azurerm_container_app_environment.container_app_environment.id    


  # kubernetes rule for accessing the container app from outside the cluster
  ingress {
    allow_insecure_connections = false
    target_port                   = 8080
    external_enabled               = true
    # == if container has multiple apps, then we can define the traffic weight for each app.
    # In this case, we have only one app, so we set the traffic weight to 100% for the primary app.
    traffic_weight {
      label = "primary"
      percentage = 100
      latest_revision = true
    }
  }

  tags = {
    environment = var.env_id
    src         = var.source_key
  }
}
