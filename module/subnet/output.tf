output "output-subnet" {
  value = {
    for key, value in azurerm_subnet.subnet :
    key => value.id
    }
}

