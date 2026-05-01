# terraform-azurerm-private-dns-zone

Reusable Terraform module for `azurerm_private_dns_zone`.

## Notes

- Supports optional SOA record customization.
- Intended for centrally managed private DNS zones in the Management subscription.
- Also manages optional private DNS zone virtual network links so the zone and its links can share the same lifecycle.

## Example

```hcl
module "private_dns_zone" {
  source = "../.."

  name                = "privatelink.blob.core.windows.net"
  resource_group_name = "rg-management-core-we-001"

  virtual_network_links = {
    hub = {
      virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-connectivity-hub-we-001/providers/Microsoft.Network/virtualNetworks/vnet-hub-we-001"
    }
  }
}
```
