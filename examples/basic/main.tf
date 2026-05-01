module "private_dns_zone" {
  source = "../.."

  name                = "privatelink.blob.core.windows.net"
  resource_group_name = "rg-management-core-we-001"
}
