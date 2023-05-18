resource "azurerm_key_vault_access_policy" "linux_web_app" {
    key_vault_id = data.azurerm_key_vault.kv.id
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = module.linux_web_app.web_app_identity_principal_id
        
    secret_permissions = [
        "Get",
        "List"
    ]
}

