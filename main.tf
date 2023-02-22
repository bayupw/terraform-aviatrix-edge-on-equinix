resource "aviatrix_edge_spoke" "this" {

  # mandatory
  gw_name                        = var.gw_name
  site_id                        = var.site_id
  management_interface_config    = var.management_interface_config
  management_interface_ip_prefix = var.management_interface_config == "Static" ? var.management_interface_ip_prefix : null
  management_default_gateway_ip  = var.management_interface_config == "Static" ? var.management_default_gateway_ip : null
  wan_interface_ip_prefix        = var.wan_interface_ip_prefix
  wan_default_gateway_ip         = var.wan_default_gateway_ip
  lan_interface_ip_prefix        = var.lan_interface_ip_prefix
  dns_server_ip                  = var.management_interface_config == "Static" ? var.dns_server_ip : null
  secondary_dns_server_ip        = var.management_interface_config == "Static" ? var.secondary_dns_server_ip : null
  ztp_file_type                  = var.ztp_file_type
  ztp_file_download_path         = var.ztp_file_download_path

  # advanced options - optional
  local_as_number = var.local_as_number
  #   prepend_as_path                  = var.prepend_as_path
  #   enable_learned_cidrs_approval    = var.enable_learned_cidrs_approval
  #   approved_learned_cidrs           = var.approved_learned_cidrs
  #   spoke_bgp_manual_advertise_cidrs = var.spoke_bgp_manual_advertise_cidrs
  #   enable_preserve_as_path          = var.enable_preserve_as_path
  #   bgp_polling_time                 = var.bgp_polling_time
  #   bgp_hold_time                    = var.bgp_hold_time
  #   enable_edge_transitive_routing   = var.enable_edge_transitive_routing
  #   enable_jumbo_frame               = var.enable_jumbo_frame
  #   latitude                         = var.latitude
  #   longitude                        = var.longitude

  lifecycle {
    ignore_changes = [management_egress_ip_prefix]
  }
}

data "local_file" "this" {
  filename = "${aviatrix_edge_spoke.this.ztp_file_download_path}/${aviatrix_edge_spoke.this.gw_name}-${aviatrix_edge_spoke.this.site_id}-cloud-init.txt"
}

data "equinix_network_account" "this" {
  metro_code = var.metro_code
}

resource "equinix_network_file" "this" {
  metro_code       = data.equinix_network_account.this.metro_code
  byol             = true
  self_managed     = true
  device_type_code = var.type_code
  process_type     = "CLOUD_INIT"
  file_name        = "${aviatrix_edge_spoke.this.gw_name}-${aviatrix_edge_spoke.this.site_id}-cloud-init.txt"
  content          = data.local_file.this.content

  lifecycle {
    ignore_changes = all
  }
}

resource "equinix_network_device" "this" {
  metro_code         = data.equinix_network_account.this.metro_code
  account_number     = data.equinix_network_account.this.number
  type_code          = var.type_code
  byol               = true
  self_managed       = true
  core_count         = var.core_count
  package_code       = var.package_code
  version            = var.device_version
  name               = var.device_name
  notifications      = var.notifications
  term_length        = var.term_length
  cloud_init_file_id = equinix_network_file.this.uuid
  acl_template_id    = local.acl_template_id
}

locals {
  acl_template_id = var.create_acl ? equinix_network_acl_template.this[0].id : var.acl_template_id
}