resource "aws_kms_key" "this" {
  provider                 = aws.use1
  customer_master_key_spec = "ECC_NIST_P256"
  key_usage                = "SIGN_VERIFY"
  deletion_window_in_days  = 7
  description              = "Route53 DNSSEC customer managed CMK"
  policy                   = data.aws_iam_policy_document.ksk.json
  tags = merge(
    var.tags,
    {
      ManagedBy = "Terraform"
      Changed   = formatdate("YYYY-MM-DD hh:mm ZZZ", timestamp())
    },
  )
}

resource "aws_kms_alias" "this" {
  provider      = aws.use1
  name_prefix   = "alias/ksk-"
  target_key_id = aws_kms_key.this.key_id
}

resource "random_string" "ksk" {
  for_each = toset(var.zone_ids)

  keepers = {
    hosted_zone_id             = each.key
    key_management_service_arn = aws_kms_key.this.arn
  }

  length  = 32
  special = false
}

resource "aws_route53_key_signing_key" "this" {
  for_each = toset(var.zone_ids)

  hosted_zone_id             = random_string.ksk[each.key].keepers.hosted_zone_id
  key_management_service_arn = aws_kms_key.this.arn
  name                       = random_string.ksk[each.key].id
}
