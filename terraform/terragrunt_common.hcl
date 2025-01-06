locals {
  creds = read_terragrunt_config(find_in_parent_folders("creds.hcl"))

  proxmox_host     = local.creds.locals.proxmox_host
  proxmox_node     = local.creds.locals.proxmox_node
  proxmox_user     = local.creds.locals.proxmox_user
  proxmox_password = local.creds.locals.proxmox_password
  opnsense_key     = local.creds.locals.opnsense_key
  opnsense_secret  = local.creds.locals.opnsense_secret
}

