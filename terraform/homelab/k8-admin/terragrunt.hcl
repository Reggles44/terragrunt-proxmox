include "root" {
  path   = find_in_parent_folders("terragrunt_common.hcl")
  expose = true
}

terraform {
  source = "git@github.com:proxmox-kubernetes/terraform-k8-admin.git"
}

inputs = {
  proxmox_host     = include.root.locals.proxmox_host
  proxmox_node     = include.root.locals.proxmox_node
  proxmox_user     = include.root.locals.proxmox_user
  proxmox_password = include.root.locals.proxmox_password
  vmid             = "1001"
  ip_address       = "192.168.8.100/24"
  gateway          = "192.168.8.1"

}
