

output "JenkinsPrivateIP"{
    value = [data.azurerm_network_interface.jenkins.private_ip_address]
}
