module "kms_key" {
  source                   = "cloudposse/kms-key/aws"
  version                  = "0.12.2"
  description              = "Route53 DNSSEC customer managed CMK"
  deletion_window_in_days  = var.deletion_window_in_days
  enable_key_rotation      = false
  key_usage                = "SIGN_VERIFY"
  customer_master_key_spec = "ECC_NIST_P256"
  policy                   = data.aws_iam_policy_document.ksk.json
  context                  = module.this.context
  attributes               = ["ksk"]
}

resource "random_string" "ksk" {
  for_each = local.zones

  keepers = {
    hosted_zone_id             = each.value.zone_id
    key_management_service_arn = module.kms_key.key_arn
  }

  length  = 32
  special = false
}

resource "aws_route53_key_signing_key" "this" {
  for_each = local.zones

  hosted_zone_id             = random_string.ksk[each.key].keepers.hosted_zone_id
  key_management_service_arn = module.kms_key.key_arn
  name                       = random_string.ksk[each.key].id
}
