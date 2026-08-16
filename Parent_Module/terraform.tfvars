rgs = {
  rg1 = {
    name     = "naren-tanuj"
    location = "centralindia"
  }
  rg2 = {
    name     = "nandu-mahi"
    location = "centralindia"
  }
}
# 3. VIRTUAL NETWORKS (2 VNets)
vnets = {
  vnet1 = {
    name                = "vnet-1"
    resource_group_name = "naren-tanuj"
    location            = "centralindia"
    address_space       = ["10.0.0.0/16"]
  }
}

# 4. SUBNETS (3 Subnets inside VNet-1)
subnets = {
  frontend = {
    name                = "Frontend"
    resource_group_name = "naren-tanuj"
    vnet_name           = "vnet-1"
    address_prefixes    = ["10.0.1.0/24"]
  }
  backend = {
    name                = "backend"
    resource_group_name = "naren-tanuj"
    vnet_name           = "vnet-1"
    address_prefixes    = ["10.0.2.0/24"]
  }
  bastion = {
    name                = "AzureBastionSubnet" # Yeh naam strict hai Azure ke rules ke hisaab se
    resource_group_name = "naren-tanuj"
    vnet_name           = "vnet-1"
    address_prefixes    = ["10.0.3.0/24"]
  }
}

# 6. NETWORK INTERFACE (NIC) & LOAD BALANCER
nics = {
  nic1 = {
    nic_name                      = "vm-frontend-nic"
    location                      = "centralindia"
    resource_group_name           = "naren-tanuj"
    ip_config_name                = "internal"
    subnet_name                   = "Frontend"
    vnet_name                     = "vnet-1"
    private_ip_address_allocation = "Dynamic"
    pip_name                      = "vm-prod-01-pip"
  }
}

pips = {
  pip1 = {
     name               = "vm-prod-01-pip"
    location            = "centralindia"
    resource_group_name = "naren-tanuj"
    allocation_method   = "Static"
  }
}

# 7. VIRTUAL MACHINE (1 VM)
vms = {
  vm1 = {
    vm_name             = "vm-prod-01"
    resource_group_name = "naren-tanuj"
    vnet_name           = "vnet-1"
    subnet_name         = "frontend"
    pip_name            = "vm-prod-01-pip"
    location            = "centralindia"
    size                = "Standard_D2s_v5"
    nic_name            = "vm-frontend-nic"
    admin_username      = "nanduuser"
    admin_password      = "Nare@Nandu12429"

  }
} 

