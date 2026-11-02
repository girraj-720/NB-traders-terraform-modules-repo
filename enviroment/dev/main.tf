module "rg" {
  source = "../../module/resource-group"
  rgs    = var.rgs
}


module "storage" {
  depends_on = [module.rg]
  source     = "../../module/storage-account"
  sts        = var.sts

}
module "ip" {
  depends_on = [module.rg]
  source     = "../../module/public-ip"
  ips        = var.ips

}
module "virtual-network" {
  depends_on = [module.rg]
  source     = "../../module/virtual-network"
  vnets      = var.vnets

}
module "subnet" {
  depends_on = [module.virtual-network]
  source     = "../../module/subnet"
  subnets    = var.subnets

}
module "virtual-machine" {
  depends_on = [module.ip, module.subnet, module.keyvault]
  source     = "../../module/virtual-machine"
  vms        = var.vms
  

}

module "keyvault" {
  depends_on = [module.rg]
  source = "../../module/azure-keyvault"
  kvs    = var.kvs

}
module "NSG" {
  source = "../../module/NSG"
  nsg_rules = var.nsg_rules
}