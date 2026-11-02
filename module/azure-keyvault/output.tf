output "output-kv" {
    value = {
        for key , value in azurerm_key_vault.kv :
        key =>value.id
    }
  
}