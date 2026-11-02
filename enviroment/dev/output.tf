
output "output-rg" {
  value = module.rg.output-rg
}
output "output-sts" {
  value = module.storage.output-st
}
output "output-ip" {
  value = module.ip.output-ip
}
output "output-vnet" {
  value = module.virtual-network.output-vnet
}
output "output-subnet" {
  value = module.subnet.output-subnet
}
output "output-vm" {
  value = module.virtual-machine.output-vm
}
output "output-kv" {
  value = module.keyvault.output-kv
  
}

output "output-nsg" {
  value = module.NSG.output-nsg
  
}