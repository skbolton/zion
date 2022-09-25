terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "2.9.11"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://apoc:8006/api2/json"
  pm_tls_insecure = true
  pm_log_enable = true
  pm_parallel = 6
  # pm_log_file   = "terraform-plugin-proxmox.log"
  # pm_debug      = true
  # pm_log_levels = {
  #   _default    = "debug"
  #   _capturelog = ""
  # }
}

resource "proxmox_vm_qemu" "apoc-vms" {
  count = 2
  name = "apoc-${count.index + 1}"
  desc = "Testing out Terraform apply"
  pool = "pool0"

  target_node = "apoc"
  clone = "ubuntu-2204-cloudinit"

  agent = 1
  os_type = "cloud-init"
  cores = 2
  sockets = 1
  cpu = "host"
  memory = 2048
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    slot = 0
    size = "32G"
    type = "scsi"
    storage = "local-lvm"
  }

  network {
    model = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [
      network
    ]
  }

  ipconfig0 = "ip=192.168.1.2${count.index}/24,gw=192.168.1.254"
}

resource "proxmox_vm_qemu" "mouse-vms" {
  count = 2
  name = "mouse-${count.index + 1}"
  desc = "Testing out Terraform apply"
  pool = "pool0"

  target_node = "mouse"
  clone = "ubuntu-2204-cloudinit"

  agent = 1
  os_type = "cloud-init"
  cores = 2
  sockets = 1
  cpu = "host"
  memory = 2048
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    slot = 0
    size = "32G"
    type = "scsi"
    storage = "local-lvm"
  }

  network {
    model = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [
      network
    ]
  }

  ipconfig0 = "ip=192.168.1.3${count.index}/24,gw=192.168.1.254"
}

resource "proxmox_vm_qemu" "tank-vms" {
  count = 2
  name = "tank-${count.index + 1}"
  desc = "Testing out Terraform apply"
  pool = "pool0"

  target_node = "tank"
  clone = "ubuntu-2204-cloudinit"

  agent = 1
  os_type = "cloud-init"
  cores = 2
  sockets = 1
  cpu = "host"
  memory = 2048
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    slot = 0
    size = "32G"
    type = "scsi"
    storage = "local-lvm"
  }

  network {
    model = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [
      network
    ]
  }

  ipconfig0 = "ip=192.168.1.4${count.index}/24,gw=192.168.1.254"
}
