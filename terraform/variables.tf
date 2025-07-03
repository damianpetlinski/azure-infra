variable "prefix" {
  description = "Prefix for all resources"
  type        = string
  default     = "myinfra"
}

variable "environment" {
  description = "Environment for the resources (e.g., dev, test, prod)"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
  default     = "westeurope"
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
  default     = "vmtest01"
}

variable "tags" {
  description = "Common tags to be applied to all resources"
  type = map(string)
  default = {
    environment = "dev"
    owner       = "your-name"
    project     = "project-name"
    managed_by  = "terraform"
  }
}

variable "allowed_ssh_ips" {
  description = "List of CIDRs allowed to access SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"] # Change to a specific CIDR for production use
}
