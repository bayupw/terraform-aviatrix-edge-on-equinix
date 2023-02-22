variable "gw_name" {
  description = "Edge gateway name."
  type        = string
  default     = "edge-equinix"
}

variable "site_id" {
  description = "Site ID."
  type        = string
  default     = "Equinix"
}

variable "management_interface_config" {
  description = "Management interface config type."
  type        = string
  default     = "Static"
}

variable "management_interface_ip_prefix" {
  description = "Dummy management interface CIDR. This will be replaced by cloud-init."
  type        = string
  default     = "192.168.10.101/24"
}

variable "management_default_gateway_ip" {
  description = "Dummy management default gateway IP. This will be replaced by cloud-init."
  type        = string
  default     = "192.168.10.254"
}

variable "wan_interface_ip_prefix" {
  description = "WAN interface CIDR."
  type        = string
  default     = "192.168.11.101/24"
}

variable "wan_default_gateway_ip" {
  description = "WAN default gateway IP."
  type        = string
  default     = "192.168.11.254"
}

variable "lan_interface_ip_prefix" {
  description = "LAN interface CIDR."
  type        = string
  default     = "192.168.12.101/24"
}

variable "dns_server_ip" {
  description = "Primary DNS server IP."
  type        = string
  default     = "8.8.8.8"
}

variable "secondary_dns_server_ip" {
  description = "Primary DNS server IP."
  type        = string
  default     = "8.8.4.4"
}

variable "ztp_file_type" {
  description = "ZTP file type."
  type        = string
  default     = "cloud-init"
}

variable "ztp_file_download_path" {
  description = "The folder path where the ZTP file will be downloaded."
  type        = string
  default     = "."
}

variable "local_as_number" {
  description = "BGP AS Number to assign to Edge as a Spoke."
  type        = string
  default     = null
}

variable "metro_code" {
  description = "Metro location."
  type        = string
  default     = "NY"
}

variable "create_acl" {
  description = "Set to true to create a new ACL."
  type        = bool
  default     = false
}

variable "acl_template_id" {
  description = "Existing ACL template ID."
  type        = string
  default     = null
}

variable "acl_name" {
  description = "ACL name."
  type        = string
  default     = "my-access-list"
}

variable "acl_description" {
  description = "ACL description."
  type        = string
  default     = "ACL description."
}

variable "type_code" {
  description = "Vendor package code."
  type        = string
  default     = "AVIATRIX_EDGE"
}

variable "core_count" {
  description = "Number of CPU cores used by device."
  type        = number
  default     = 2
}

variable "package_code" {
  description = "Software package code."
  type        = string
  default     = "STD"
}

variable "device_version" {
  description = "Vendor software version."
  type        = string
  default     = "6.9"
}

variable "device_name" {
  description = "Equinix Network device name."
  type        = string
  default     = "aviatrixedge"
}

variable "device_hostname" {
  description = "Equinix Network device hostname."
  type        = string
  default     = "aviatrixedge"
}

variable "notifications" {
  description = "List of email addresses that will receive device status notifications."
  type        = list(string)
  default     = ["myemail@equinix.com"]
}

variable "term_length" {
  description = "Device term length in months."
  type        = number
  default     = 1
}

variable "filepath" {
  description = "Cloud init file path."
  type        = string
  default     = "."
}

variable "file_name" {
  description = "Cloud init file name."
  type        = string
  default     = "cloud-init.txt"
}