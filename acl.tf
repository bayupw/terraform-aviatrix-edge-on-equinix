data "http" "myip" {
  count = var.create_acl ? 1 : 0

  url = "http://ifconfig.me"
}

resource "equinix_network_acl_template" "this" {
  count = var.create_acl ? 1 : 0

  name        = var.acl_name
  description = var.acl_description

  inbound_rule {
    subnet      = "${chomp(data.http.myip[0].response_body)}/32"
    protocol    = "IP"
    src_port    = "any"
    dst_port    = "any"
    description = "Inbound from my IP"
  }
}