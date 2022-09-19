terraform {
  required_version = ">= 0.14"
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.11"
    }
  }
}

provider "proxmox" {
  pm_parallel     = 1
  pm_tls_insecure = true
  pm_api_url      = var.pm_api_url
  pm_password     = var.pm_password
  pm_user         = var.pm_user
}

resource "proxmox_vm_qemu" "vm" {
  provider    = proxmox
  vmid        = var.vm_id
  name        = var.vm_name
  target_node = var.target_node
  clone       = var.template
  agent       = 1
  onboot      = true
  os_type     = "cloud-init"
  cores       = var.cores
  sockets     = "1"
  memory      = var.memory
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"
  disk {
    slot     = 0
    size     = var.disk_size
    type     = "scsi"
    storage  = "local-lvm"
    iothread = 1
  }
  network {
    model  = "virtio"
    bridge = var.vmbr
    tag    = var.tag
  }

  ciuser     = var.username
  cipassword = var.cipassword
  ipconfig0  = "ip=192.168.${var.tag}.${var.vm_id}/24,gw=192.168.${var.tag}.1"
  sshkeys    = <<EOF
  ${var.ssh_key}
  EOF 
}
