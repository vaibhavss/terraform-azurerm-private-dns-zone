# terraform-azurerm-private-dns-zone

Reusable Terraform module for `azurerm_private_dns_zone`.

## Notes

- Supports optional SOA record customization.
- Intended for centrally managed private DNS zones in the Management subscription.

## Example

```hcl
module "private_dns_zone" {
  source = "../.."

  name                = "privatelink.blob.core.windows.net"
  resource_group_name = "rg-management-core-we-001"
}
```
