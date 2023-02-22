# Terraform Aviatrix Edge on Equinix

Terraform module for creating Aviatrix Edge Gateway on Aviatrix Controller and deploying Aviatrix Edge on Equinix.

To run this project, you will need to set the following environment variables or the [shared configuration and credentials files](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html).
- EQUINIX_API_CLIENTID
- EQUINIX_API_CLIENTSECRET
- AVIATRIX_CONTROLLER_IP
- AVIATRIX_USERNAME
- AVIATRIX_PASSWORD

See the [Developer Platform](https://developer.equinix.com/docs?page=/dev-docs/fabric/overview) page on how to generate Client ID and Client Secret.

## Sample usage

```hcl
module "aviatrix-edge" {
  source          = "bayupw/edge-on-equinix/aviatrix"
  version         = "1.0.0"

  gw_name                        = "edge-on-equinix"
  site_id                        = "Equinix-NY"
  management_interface_ip_prefix = "192.168.10.101/24"
  management_default_gateway_ip  = "192.168.10.254"
  wan_interface_ip_prefix        = "192.168.11.101/24"
  wan_default_gateway_ip         = "192.168.11.254"
  lan_interface_ip_prefix        = "192.168.12.101/24"
  metro_code                     = "NY"
  core_count                     = 2
  device_name                    = "edge-on-equinix"
  notifications                  = ["myemail@equinix.com"]
  create_acl                     = false
  acl_template_id                = "fee881d0-c9fe-7248-86da-43890c913a13"
  device_version                 = "6.9"
}
```

## Contributing

Report issues/questions/feature requests on in the [issues](https://github.com/bayupw/terraform-aviatrix-edge-on-equinix/issues/new) section.

## License

Apache 2 Licensed. See [LICENSE](https://github.com/bayupw/terraform-aviatrix-edge-on-equinix/tree/master/LICENSE) for full details.