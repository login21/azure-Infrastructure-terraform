# terraform-appservice-plan


## Create a app-service plsn in Azure

This Terraform module deploys a App Service plan in the specified resource group with configured resoucing options.

## Usage
```hcl
resource "azurerm_resource_group" "test" {
  name     = "my-resources"
  location = "West Europe"
}

module  "azurerm_app_service_plan" "example" {
  name                = "api-appserviceplan-pro"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }

  tags = {
    environment = "dev"
    costcenter  = "it"
  }
}

```

## Test

### Configurations

- [Configure Terraform for Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/terraform-install-configure)


### Native (Mac/Linux)

#### Prerequisites

- [Terraform **(~> 0.11.7)**](https://www.terraform.io/downloads.html)

#### Environment setup


#### Run test



## Authors

Created by [name](http://github.com/name)

## License

[MIT](LICENSE)
