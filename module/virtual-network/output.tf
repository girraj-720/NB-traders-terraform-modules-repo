output "output-vnet" {
    value = {
    for key, value in azurerm_virtual_network.vnet :
    key => value.id
    }
  
}
