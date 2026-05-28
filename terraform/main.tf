provider "proxmox" {
  pm_api_url  = var.pm_api_url
  pm_api_token_id = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_tls_insecure = true
  pm_parallel = 10
}

resource "proxmox_vm_qemu" "vm" {
#Hardware Setup
  for_each = var.vms

  target_node = var.target_node
  vmid    = each.value.vmid
  name    = each.key
  cores   = each.value.cpu
  memory  = each.value.memory 
  agent   = 1
  clone   = var.template_name
  full_clone  = true 
  onboot = true
  scsihw   = "virtio-scsi-pci"

   network {
    id = 0
    model = "virtio"
    bridge = var.network_bridge
    #tag =        ##Can be added if needed
    }

#Disk setup

disks {
    ide {
      ide3 {
        cloudinit {
        storage = var.storage
      }
    }
 }
        scsi {
            scsi0 {
                disk {
                size    = each.value.disk
                storage = var.storage
          }
        }
      }
    } 

  lifecycle {
    ignore_changes = [
      network,
    ]
  }


# Cloud init configuration

  ciuser = var.ciuser
  ipconfig0 = "ip=${each.value.ip}/24,gw=192.168.10.1"
  sshkeys = <<EOF
     ${var.ssh_public_key}
  EOF

}

