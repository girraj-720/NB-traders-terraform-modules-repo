output "output-nsg" {
    value = {
        for key , value in azurermazurerm_network_security_group.nsg:
        key => value.id
    }
  
}