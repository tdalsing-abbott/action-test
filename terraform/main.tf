terraform {
  backend "azurerm" {
    resource_group_name = "storage-rg"
    storage_account_name = "tdalsingsa"
    container_name = "devbackend"
    key = "test.tfstate"
  }
}
provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_api_management" "example_apim_2" {
  name                = "tdalsing-example-apim-2"
  location            = "East US"
  resource_group_name = "dev-rg"
  publisher_name      = "My Company"
  publisher_email     = "company@terraform.io"


  sku_name = "Developer_1"

  policy {
    xml_content = <<XML
    <policies>
      <inbound />
      <backend />
      <outbound />
      <on-error />
    </policies>
XML
  }
}
