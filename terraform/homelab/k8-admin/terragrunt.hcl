include "root" {
  path   = find_in_parent_folders("terragrunt_common.hcl")
  expose = true
}

terraform {
  source = "git@github.com:proxmox-kubernetes/terraform-k8-admin.git"
}

dependency "k8-vlan" {
  config_path = "../k8-vlan/"
}

inputs = {
  proxmox_host     = include.root.locals.proxmox_host
  proxmox_node     = include.root.locals.proxmox_node
  proxmox_user     = include.root.locals.proxmox_user
  proxmox_password = include.root.locals.proxmox_password
  opnsense_key     = include.root.locals.opnsense_key
  opnsense_secret  = include.root.locals.opnsense_secret
  ip               = "192.168.8.100"
  subnet_id        = dependency.k8-vlan.outputs.subnet_id
  vmid             = "1001"
}
