packer {
  required_plugins {
    vmware = {
      version = ">= 1.0.3"
      source = "github.com/hashicorp/vmware"
    }
  }
}

source "vmware-iso" "ubuntu-22-04-server" {
  // Docs: https://www.packer.io/plugins/builders/vmware/iso

  // VM Info
  vm_name       = "ubuntu-22-04-server"
  guest_os_type = "ubuntu64Guest"
  version       = "16"
  headless      = false
  // Virtual Hardware Specs
  memory        = 4096
  cpus          = 1
  cores         = 2
  disk_size     = 32768
  sound         = false
  disk_type_id  = 0
  network       = "VMnet8"
  
  // ISO Details
  iso_urls =["PATH-TO-ISO/ubuntu-22.04-live-server-amd64.iso"]
  iso_checksum = "none"
  output_directory  = "PATH-TO-BUILD/Ubuntu-22.04-Build"
  snapshot_name     = "clean"  
  // HTTP-Server Directory
  http_directory    = "http"
  // SSH Parameter
  ssh_timeout = "25m"
  ssh_clear_authorized_keys = true
  ssh_username      = "ubuntu"
  ssh_password      = "ubuntu"
  shutdown_command  = ""

  // Boot Options
  boot_wait = "5s"
  boot_command = [
        "<esc><wait>",
        "e<wait>",
        "<down><down><down><end>",
        "<bs><bs><bs><bs><wait>",
        "autoinstall ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ ---<wait>",
        "<f10><wait>"
  ]

}

build {
  sources = ["sources.vmware-iso.ubuntu-22-04-server"]
}