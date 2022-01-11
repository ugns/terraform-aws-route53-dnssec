output "this_key_arn" {
  description = "Deprecated: KMS key arn for Route53 DNSSEC CMK"
  value       = module.kms_key.key_arn
}

output "key_arn" {
  description = "KMS key arn for Route53 DNSSEC CMK"
  value       = module.kms_key.key_arn
}
