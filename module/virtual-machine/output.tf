output "output-vm" {
    value = {
    for key, value in azurerm_network_interface.nic :
    key => value.id
    }
  
}
