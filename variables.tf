variable "zones" {
  description = <<-EOT
    (Optional) A map of hosted zones with `zone_id` to assign the
    KSK to in the format of:
    ```
    {
      "example.com" = {
          zone_id = "Z8VLZEXAMPLE"
      }
    }
    ```
    Defaults to `{}` which will generate the KMS key and alias but
    not assign it to a hosted zone which can be useful for staging.
    EOT
  type        = map(map(string))
  default     = {}
}

variable "deletion_window_in_days" {
  type        = number
  description = <<-EOT
    (Optional) The waiting period, specified in number of days. 
    After the waiting period ends, AWS KMS deletes the KMS key.
    If you specify a value, it must be between 7 and 30, inclusive.
    Defaults to `7`.
    EOT
  default     = 7
}

locals {
  zones = module.this.enabled ? var.zones : {}
}