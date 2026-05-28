variable "pm_api_url" {
  description = "Proxmox API URL"
  type        = string
  default     = "https://PROXMOX_IP:8006/api2/json"
}

variable "pm_api_token_id" {
  description = "Proxmox API Token ID"
  type        = string
  default = "USERNAME@REALM!TOKEN_ID"
}

variable "pm_api_token_secret" {
  description = "Proxmox API Token Secret"
  type        = string
  sensitive   = true
  default = "TOKEN_SECRET"
}

variable "target_node" {
  description = "Proxmox node where the VMs will be deployed"
  type        = string
  default     = "NODE"
}

variable "template_name" {
  description = "name of the template"
  type        = string
  default     = "ubuntu-2404-cloudinit-template"
}

variable "storage" {
  description = "Storage location for the VM disk"
  type        = string
  default     = "STORAGE"
}

variable "network_bridge" {
  description = "Network bridge for the VM"
  type        = string
  default     = "vmbr0"
}

variable "ssh_public_key" {
  description = "SSH public key for user access"
  type        = string
  default = "SSH_PUB_KEY"
}

variable "ciuser"{
  description = "cloud init user to login with"
  type =string
  default ="ubuntu"
}

variable "vms"{
  type = map(object({
    cpu = number
	memory = number
	disk = string
	ip = string
	vmid = number
  }))
  
  default = {
    "web-01" = {
	  cpu = 2
	  memory = 2048
	  disk = "20G"
	  ip = "192.168.10.40"
	  vmid = 1001
	}
	
	"db-01" = {
	  cpu = 2
	  memory = 2048
	  disk = "20G"
	  ip = "192.168.10.41"
	  vmid = 1002
	}
	
	"monitor-01" = {
	  cpu = 2
	  memory = 2048
	  disk = "20G"
	  ip = "192.168.10.42"
	  vmid = 1003
	}
  }
}