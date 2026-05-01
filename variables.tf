variable "name" {
  description = "The private DNS zone name."
  type        = string
}

variable "resource_group_name" {
  description = "The resource group that contains the private DNS zone."
  type        = string
}

variable "soa_record" {
  description = "Optional SOA record settings for the private DNS zone."
  type = object({
    email        = string
    expire_time  = optional(number)
    minimum_ttl  = optional(number)
    refresh_time = optional(number)
    retry_time   = optional(number)
    ttl          = optional(number)
    tags         = optional(map(string))
  })
  default = null
}

variable "tags" {
  description = "Tags to apply to the private DNS zone."
  type        = map(string)
  default     = {}
}

variable "timeouts" {
  description = "Optional custom timeouts for the private DNS zone."
  type = object({
    create = optional(string)
    read   = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = null
}
