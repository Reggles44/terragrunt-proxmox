include "root" {
  path   = find_in_parent_folders("terragrunt_common.hcl")
  expose = true
}

terraform {
  source = "git@github.com:proxmox-kubernetes/terraform-k8-vlan.git"
}

inputs = {
  opnsense_key    = include.root.locals.opnsense_key
  opnsense_secret = include.root.locals.opnsense_secret
  subnet_ip       = "192.168.8.0/24"
  subnet_desc     = "k8"
  subnet_pool     = "192.168.8.100-192.168.8.199"
}

