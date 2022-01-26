# Migration to v1.0.0

## New Features

With v1.0.0 we have tried to follow a more consistent pattern in 
module design. 

- Use of the `context` provided by the [terraform-null-label](https://github.com/cloudposse/terraform-null-label) module.
- Ability to process hosted zones from other modules easier.

## Breaking changes in v1.0.0

Releases prior to v1.0.0 of this module attempted to maintain compatibility, so required no code changes were needed.
With v1.0.0 in order to address reported issues changes to the code
were necessary that did not allow for upgrade without code changes. If you are unable to afford a break in functionality during upgrade lock
version to an earlier compatible version.

### Behavior changes

- Previously, the `aws_route53_key_signing_key` and `random_string`
resources used an index based on the hosted zone ID as passed in by the `zone_ids` variable. This caused an issue where the values were 
not known until apply affecting plan execution.

- Previously, the `aws_kms_key` and `ams_key_alias` resources were 
handled internally. These are now handled with an external module
which will destroy the old resources upon apply.

- Previously, prior to Terraform 1.0 `provider` blocks were necessary
inside external modules when requiring change from root module values. This causes issues when executing with newer versions.

### Input Variable Changes

- `zone_ids` removed. Use `zones` instead.

- `zones` added. Internal changes required a new format for input
of zones to assign the KSK to.

- `deletion_window_in_days` added. To change the deletion window on
key from the previous hard-coded default of 7 days.

### Output Variable Changes

- `this_key_arn` deprecated. Use `key_arn` instead.

- `key_arm` added. Supplies the KMS key ARN setup for Route53 hosted zone KSK.