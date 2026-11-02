

data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "kv" {
    for_each = var.kvs
  name                        = each.value.kv_name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  rbac_authorization_enabled  = true
  enabled_for_disk_encryption = false
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"
}


data "azurerm_subscription" "primary" {
}

data "azurerm_client_config" "clint_id" {
}

resource "azurerm_role_assignment" "keyvault" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = data.azurerm_client_config.clint_id.object_id
}
