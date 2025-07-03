# Azure VM Deployment Test

## What It Does

### Terraform provisions:

- Resource Group  
- Virtual Network and Subnet  
- Public IP and Network Interface  
- Network Security Group (NSG) with inbound rule allowing SSH (port 22)  
- Linux Virtual Machine with SSH key access  
- Storage Account for boot diagnostics

### Ansible configures:

- The virtual machine using the Azure API module (`azure_rm_virtualmachine`)  
- Installs and starts Nginx

## How to Run (via Azure DevOps)

### 1. Setup

- Create a Service Connection in Azure DevOps named `terraform-connection`
- Assign it access to your Azure subscription (and optionally target Resource Group)

### 2. Commit & Push

- Push the repository (including `azure-pipelines.yml` in the root directory) to GitHub or Azure Repos

### 3. Pipeline Flow

The pipeline defined in `azure-pipelines.yml` will:

1. Install Terraform and Ansible
2. Run `terraform init` using backend config: `terraform/environments/dev/backend.tfvars`
3. Run `terraform plan` and `apply` using: `terraform/environments/dev/variables.tfvars`
4. Export outputs (`vm_ip`, `ssh_private_key`) as pipeline variables
5. Run Ansible playbook from `ansible/playbook.yml`, using the exported VM IP and SSH key

## Key Variables

| Name                    | Source                   | Description                                   |
|-------------------------|---------------------------|-----------------------------------------------|
| `TF_VERSION`            | `azure-pipelines.yml`     | Version of Terraform to install               |
| `ENVIRONMENT`           | `azure-pipelines.yml`     | Target environment (e.g. `dev`)               |
| `terraform-connection`  | Azure DevOps              | Service connection to Azure (ARM provider)    |
