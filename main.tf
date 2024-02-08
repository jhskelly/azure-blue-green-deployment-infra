provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "blue-green-rg" {
  name     = "blue-green-rg"
  location = "UK South"
}


resource "azurerm_service_plan" "blue-green-service-plan" {
  name                = "blue-green-appservice-plan"
  location            = azurerm_resource_group.blue-green-rg.location
  resource_group_name = azurerm_resource_group.blue-green-rg.name
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "blue-green-service" {
  name                = "blue-green-appservice"
  resource_group_name = azurerm_resource_group.blue-green-rg.name
  location            = azurerm_service_plan.blue-green-service-plan.location
  service_plan_id     = azurerm_service_plan.blue-green-service-plan.id

  site_config {}
}

resource "azurerm_linux_web_app_slot" "blue-green-staging-slot" {
  name                = "staging"
  app_service_id      = azurerm_linux_web_app.blue-green-service.id
  site_config {}
}

# NOTE I wouldn't call this a prod slot
resource "azurerm_linux_web_app_slot" "blue-green-prod-slot" {
  name                = "production"
  app_service_id      = azurerm_linux_web_app.blue-green-service.id
  site_config {}
}
