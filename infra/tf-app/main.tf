resource "azurerm_resource_group" "app_rg" {
  name     = "shak0039-a12-rg"
  location = "Canada Central"
}


resource "azurerm_virtual_network" "vnet" {
  name                = "ha000070-vnet"
  location            = "Canada Central"
  resource_group_name = azurerm_resource_group.app_rg.name
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = "test"
  }
}

resource "azurerm_subnet" "subnet" {
  name                 = "ha000070-subnet"
  resource_group_name  = azurerm_resource_group.app_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]

  service_endpoints = ["Microsoft.Storage", "Microsoft.Sql"]

  tags = {
    environment = "test"
  }
}