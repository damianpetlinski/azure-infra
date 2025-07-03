# Azure VM Deployment Test

## Prerequisites

- Azure subscription & service principal for Terraform and Ansible authentication (optional)
- Terraform installed (locally or via Azure Cloud Shell)
- Ansible CLI installed with `azure.azcollection` available
- Azure DevOps project with appropriate permissions

---

## Test Steps

### 1. Initialize the Git Repository
- Create a new **public Git repository**.

### 2. Write the Terraform Configuration
- Add Terraform files based on official documentation.
- Define:
  - `azurerm` provider
  - Resource Group
  - Virtual Network
  - Subnet
  - Public IP
  - Network Interface (NIC)
  - Linux or Windows Virtual Machine

### 3. Develop the Ansible Playbook
- Create `ansible/playbook.yml`.
- Use Azure modules (from official `azure.azcollection` documentation), such as `azure_rm_virtualmachine`, to connect and configure the VM.

### 4. Define the Azure DevOps Pipeline
- Add `azure-pipelines.yml` with stages to:
  - Install required tools
  - Run `terraform init`, `plan`, `apply`
  - Execute `ansible-playbook`  
  *(A preview run is enough if no Azure subscription is available.)*

### 5. Configure Service Connections & Variables
- Set up Azure Service Connection in Azure DevOps.
- Define pipeline variables such as:
  - Resource Group name
  - VM name

### 6. Commit & Push
- Push all project files to the repository:
  - Terraform code
  - Ansible playbook
  - Pipeline YAML
  - `README.md`

---

## Submission Guidelines

- Provide the **URL** of the public repository.
- Ensure `README.md` includes:
  - Prerequisites
  - Pipeline usage instructions
  - Outputs
- Verify the pipeline runs successfully on a **fresh fork**.

---

## Evaluation Criteria

- **Correctness**: Terraform and Ansible tasks complete without errors  
  *(best effort if Azure subscription is unavailable – preview is sufficient)*  
- **Modularity & Clarity**: Code is organized and uses meaningful variable names
- **Pipeline Integration**: YAML triggers on push and runs all deployment stages
- **Documentation**: Instructions are clear, concise, and easy to follow
- **Idempotency**: Re-running the pipeline should not cause unintended changes
