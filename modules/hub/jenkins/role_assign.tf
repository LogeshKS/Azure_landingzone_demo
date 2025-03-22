# Assign Role to allow Azure AD login
resource "azurerm_role_assignment" "vm_ad_login" {
  scope                = azurerm_linux_virtual_machine.jenkins.id
  role_definition_name = "Jenkins Virtual Machine Administrator Login"
  principal_id         = data.azurerm_client_config.current.object_id
}

#assign AAD Login role to Jenkins
resource "azurerm_virtual_machine_extension" "aad_login" {
  name                 = "AADLoginForLinux"
  virtual_machine_id   = azurerm_linux_virtual_machine.jenkins.id
  publisher           = "Microsoft.Azure.ActiveDirectory"
  type                = "AADLoginForLinux"
  type_handler_version = "1.0"
}

# resource "azurerm_role_assignment" "vm_admin" {
#   scope                = azurerm_linux_virtual_machine.jenkins.id
#   role_definition_name = "Virtual Machine Administrator Login"
#   principal_id         = var.aad_user_object_id
# }
