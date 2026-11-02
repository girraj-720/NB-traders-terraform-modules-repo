output "output-st" {
    value = {
    for key, value in azurerm_storage_account.st :
    key => value.id
    }
  
}
