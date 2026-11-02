output "output-ip" {
    value = {
    for key, value in azurerm_public_ip.ip :
    key => value.id
    }
  
}
