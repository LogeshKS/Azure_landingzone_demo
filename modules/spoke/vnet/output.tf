output "spokevpc" {
    value = azurerm_virtual_network.spoke.name
}

output "akssubnetid"{
    value = azurerm_subnet.Aks.id
}
