# AWS Route53 DNSSEC Terraform Module

Terraform module which creates an AWS Key Management Service (KMS) Customer 
Managed Key (CMK) for Route53 DNS to use as a Key-signing Key (KSK) for
enabling DNSSEC on a Hosted Zone.

KSK is setup using a random string and CMK sets up using a name prefix of 
'alias/ksk-'. CMK has an AWS recommended IAM key policy applied to it and
is created as an Asymmetric ECC_NIST_P256/ECDSA_SHA_256 key as required.

## Terraform versions

Current module supports Terraform >= 0.13. Submit pull-requests to `main` branch.

## Usage 

```hcl
module "ksk" {
  source  = "UGNS/route53-dnssec/aws"
  version = "0.1.0"

  zone_ids = [
    "Z2ES7B9AZ6SHAE",
  ]

  tags = {
    Name = "my-domain.com"
  }
}
```

## Conditional creation

Sometimes you need to create the CMK but conditionally not apply it to any Route53 
Hosted Zone. In this instance you can leave `zone_ids` empty and the KMS CMK will
be generated but no KSK will be created and applied to Route53.

```hcl
module "ksk" {
  source  = "UGNS/route53-dnssec/aws"

  # ... omitted
}
```

## Notes

Manual steps will still need to be taken to actually enable DNSSEC for the Route53 
Hosted Zone.

* Establish a chain of trust with domain registrar
* Enable DNSSEC signing with the KSK

These steps can not be automated at this time and thus require manual effort to
complete the process. Until both steps are taken DNSSEC will not be protecting
your zone records.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | ~> 3.0 |
| random | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.0 |
| random | ~> 3.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| tags | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |
| zone\_ids | A list of Hosted Zone IDs to assign KSK to | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| this_key_arn | KMS key ARN for Route53 DNSSEC CMK |

## Authors

Module managed by [Jeremy T. Bouse](https://github.com/jbouse) for [UnderGrid Network Services](https://github.com/UGNS).

## License

Mozilla Public License 2.0. See LICENSE for fulld details.
