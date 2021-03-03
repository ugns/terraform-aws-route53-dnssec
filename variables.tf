variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource"
  default     = {}
}

variable "zone_ids" {
  description = "A list of Hosted Zone IDs to assign KSK to"
  type        = list(string)
  default     = []
}