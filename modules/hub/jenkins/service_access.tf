#Here we are writing the code to which services jenkins should have access to identity management


#jenkins to ACR access
resource "azurerm_role_assignment" "acr_pull" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_linux_virtual_machine.jenkins.identity[0].principal_id
}

# jenkins to AKS admin access
resource "azurerm_role_assignment" "aks_admin" {
  scope                = var.aks_id
  role_definition_name = "Azure Kubernetes Service RBAC Writer"
  principal_id         = azurerm_linux_virtual_machine.jenkins.identity[0].principal_id
}