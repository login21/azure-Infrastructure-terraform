# -------------------------------------------------------------
# Resource Group variables
# -------------------------------------------------------------
name     = "test-01-vnet"
location = "australiaeast"
tags = {
  environment = "nonprod",
  project     = "test"
}


## Vnet config
vnet_name     = "vnet-test-01"
address_space = "10.0.0.0/24"

subnets = [
  {
    subnet_name           = "dmz-subnet"
    subnet_address_prefix = ["10.1.2.0/24"]
    service_endpoints     = []
    delegation = []
  },

  {
    subnet_name           = "app-subnet"
    subnet_address_prefix = ["10.1.3.0/24"]
    service_endpoints     = ["Microsoft.Storage"]
    delegation = []

  },

  {
    subnet_name           = "data-subnet"
    subnet_address_prefix = ["10.1.4.0/24"]
    service_endpoints     = ["Microsoft.Storage"]
     delegation = [{
       delegation_name = "delegation"
       service_delegation_name = "Microsoft.ContainerInstance/containerGroups"
        actions = [
          "Microsoft.Network/virtualNetworks/subnets/join/action", 
          "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
          "Microsoft.Network/networkinterfaces/*"
          ]

     }]
  }
]

nsg_details = [
  {
    nsg_name = "test_nsg"

    associated_subnets = ["dmz-subnet", "app-subnet"]

    security_rules = [

      {
        name                       = "test123"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "80"
        destination_port_range     = "*"
        source_address_prefix      = "0.0.0.0/0"
        destination_address_prefix = "*"
        description                = null
      },
      {
        name                       = "test234"
        priority                   = 101
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "443"
        destination_port_range     = "*"
        source_address_prefix      = "0.0.0.0/0"
        destination_address_prefix = "*"
        description                = null
      },
      {
        name                       = "weballow2"
        priority                   = 102
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "8080-8090"
        destination_port_range     = "*"
        source_address_prefix      = "0.0.0.0/0"
        destination_address_prefix = null
        description                = null
      }

    ]

  },
  {
    nsg_name = "test1_nsg"

    associated_subnets = ["dmz-subnet", "app-subnet"]

    security_rules = [

      {
        name                       = "test123"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "80"
        destination_port_range     = "*"
        source_address_prefix      = "0.0.0.0/0"
        destination_address_prefix = "*"
        description                = null
      },
      {
        name                       = "test234"
        priority                   = 101
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "443"
        destination_port_range     = "*"
        source_address_prefix      = "0.0.0.0/0"
        destination_address_prefix = "*"
        description                = null
      },
      {
        name                       = "weballow2"
        priority                   = 102
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "8080-8090"
        destination_port_range     = "*"
        source_address_prefix      = "0.0.0.0/0"
        destination_address_prefix = null
        description                = null
      }

    ]

  }

]

vnet_peering_name = "test_vnet_peering"

remote_virtual_network_id = "common-vnet"


## Bastion Varibales 
bastion_host_name = "test-bastion"
public_ip_address_id = "testid"