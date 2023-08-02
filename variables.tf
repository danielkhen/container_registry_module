variable "name" {
  description = "(Required) The name of the container registry."
  type        = string
}

variable "location" {
  description = "(Required) The location of the container registry."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The resource group name of the container registry."
  type        = string
}

variable "sku" {
  description = "(Required) The SKU of the container registry."
  type        = string

  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku)
    error_message = "The SKU possible values are Basic, Standard and Premium."
  }
}

variable "public_network_access_enabled" {
  description = "(Optional) Should the acr have public network access."
  type        = bool
  default     = false
}

variable "private_endpoint_enabled" {
  description = "(Optional) Should the container registry have a private endpoint."
  type        = bool
  default     = false
}

variable "private_endpoint_name" {
  description = "(Optional) The name of the private endpoint."
  type        = string
  default     = null
}

variable "private_dns_enabled" {
  description = "(Optional) Should the private endpoint be attached to a private dns zone."
  type        = bool
  default     = false
}

variable "dns_name" {
  description = "(Optional) The name of the private dns zone."
  type        = string
  default     = null
}

variable "log_analytics_id" {
  description = "(Required) The id of the log analytics workspace."
  type        = string
}

variable "private_endpoint_subnet_id" {
  description = "(Optional) The subnet id of the private endpoint."
  type        = string
  default     = false
}

variable "vnet_links" {
  description = "(Optional) A list of virtual networks to link with the private dns zone."
  type = list(object({
    name    = string
    vnet_id = string
  }))
  default = []
}