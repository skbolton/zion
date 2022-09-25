resource "proxmox_vm_qemu" "kubernetes-controller" {
  name = "kube-ctrl"
  desc = "Kubernetes Controller Node"
  onboot = true

  target_node = "apoc"
  clone = "ubuntu-2204-cloudinit"

  agent = 1
  os_type = "cloud-init"
  cores = 2
  sockets = 1
  cpu = "host"
  memory = 4096
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

  ipconfig0 = "ip=192.168.1.20/24,gw=192.168.1.254"

  ciuser = "serveradmin"
  sshkeys = var.ssh_key
}

resource "proxmox_vm_qemu" "Kubernetes-workers" {
  count = 2
  name = "kube-worker-${count.index + 1}"
  desc = "Kubernetes Worke Nodes"
  onboot = true

  target_node = "mouse"
  clone = "ubuntu-2204-cloudinit"

  agent = 1
  os_type = "cloud-init"
  cores = 2
  sockets = 1
  cpu = "host"
  memory = 4096
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

  ciuser = "serveradmin"
  sshkeys = var.ssh_key
}

resource "proxmox_vm_qemu" "couchdb-cluster" {
  count = 3
  name = "couch-${count.index + 1}"
  desc = "CouchDB cluster node"
  onboot = true

  target_node = "tank"
  clone = "ubuntu-2204-cloudinit"

  agent = 1
  os_type = "cloud-init"
  cores = 1
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

  ciuser = "serveradmin"
  sshkeys = var.ssh_key
}

