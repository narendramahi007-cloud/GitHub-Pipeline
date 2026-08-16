module "Resource_group" {
  source = "../xchild_Module/Resource_group"
  rgs    = var.rgs
}

module "Vnet" {
  source     = "../xchild_Module/Vnet"
  vnets      = var.vnets
  depends_on = [module.Resource_group]
}

# Today date added

module "Subnet" {
  source     = "../xchild_Module/Subnet"
  subnets    = var.subnets
  depends_on = [module.Vnet]
}

module "Network_Interface_card" {
  source     = "../xchild_Module/Network_Interface_card"
  nics       = var.nics
  depends_on = [module.Subnet, module.public_ip]
}

module "public_ip" {
  source     = "../xchild_Module/public_ip"
  pips       = var.pips
  depends_on = [module.Resource_group]
}

module "Virtual_machine" {
  source     = "../xchild_Module/Virtual_machine"
  vms        = var.vms
  depends_on = [module.Network_Interface_card]
}

