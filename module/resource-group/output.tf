output "output-rg" {
    value = {
    for key, value in azurerm_resource_group.rg : 
    key => value.id
    }
  
}
