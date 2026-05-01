resource "azurerm_private_dns_zone" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  tags                = var.tags

  dynamic "soa_record" {
    for_each = var.soa_record == null ? [] : [var.soa_record]

    content {
      email        = soa_record.value.email
      expire_time  = try(soa_record.value.expire_time, null)
      minimum_ttl  = try(soa_record.value.minimum_ttl, null)
      refresh_time = try(soa_record.value.refresh_time, null)
      retry_time   = try(soa_record.value.retry_time, null)
      ttl          = try(soa_record.value.ttl, null)
      tags         = try(soa_record.value.tags, null)
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts == null ? [] : [var.timeouts]

    content {
      create = try(timeouts.value.create, null)
      read   = try(timeouts.value.read, null)
      update = try(timeouts.value.update, null)
      delete = try(timeouts.value.delete, null)
    }
  }
}

resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  for_each = var.virtual_network_links

  name                  = try(each.value.name, each.key)
  private_dns_zone_name = azurerm_private_dns_zone.this.name
  resource_group_name   = azurerm_private_dns_zone.this.resource_group_name
  virtual_network_id    = each.value.virtual_network_id
  registration_enabled  = try(each.value.registration_enabled, null)
  resolution_policy     = try(each.value.resolution_policy, null)
  tags                  = try(each.value.tags, {})

  dynamic "timeouts" {
    for_each = try(each.value.timeouts, null) == null ? [] : [each.value.timeouts]

    content {
      create = try(timeouts.value.create, null)
      read   = try(timeouts.value.read, null)
      update = try(timeouts.value.update, null)
      delete = try(timeouts.value.delete, null)
    }
  }
}
