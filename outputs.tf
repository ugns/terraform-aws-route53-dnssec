output "this_key_arn" {
  description = "KMS key arn for Route53 DNSSEC CMK"
  value       = aws_kms_key.this.arn
}
