prefix           = "myinfra"
environment      = "dev"
location         = "westeurope"
vm_name          = "vm-dev-01"

tags = {
  environment = "dev"
  owner       = "damian"
  project     = "azure-vm-deployment"
  managed_by  = "terraform"
}

allowed_ssh_ips = ["89.77.11.22/32"]
