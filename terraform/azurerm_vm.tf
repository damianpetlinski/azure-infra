resource "tls_private_key" "main_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "azurerm_linux_virtual_machine" "main" {
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = azurerm_resource_group.main.name
  network_interface_ids = [azurerm_network_interface.main.id]
  size                  = "Standard_B1s"
  admin_username        = "azureuser"
              
  disable_password_authentication = true

  admin_ssh_key {
      username   = "azureuser"
      public_key = tls_private_key.main_ssh.public_key_openssh
    }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "25.04-LTS"
    version   = "latest"
  }
  
  boot_diagnostics {
    enabled     = true
    storage_uri = azurerm_storage_account.main.primary_blob_endpoint
  }
  
  tags = var.tags
}
