variable "zones" {
  description = "A list of Hosted Zone IDs to assign KSK to"
  type        = map(map(string))
  default     = {}
}

variable "deletion_window_in_days" {
  type        = number
  description = "(optional) describe your variable"
  default     = 7
}

locals {
  zones = module.this.enabled ? var.zones : {}
}