
<!-- markdownlint-disable -->
# terraform-aws-route53-dnssec [![Latest Release](https://img.shields.io/github/release/ugns/terraform-aws-route53-dnssec.svg)](https://github.com/ugns/terraform-aws-route53-dnssec/releases/latest)
<!-- markdownlint-restore -->

[![UnderGrid Network Services][logo]](https://undergrid.net)

<!--




  ** DO NOT EDIT THIS FILE
  **
  ** This file was automatically generated by the `build-harness`.
  ** 1) Make all changes to `README.yaml`
  ** 2) Run `make init` (you only need to do this once)
  ** 3) Run`make readme` to rebuild this file.
  **
  ** (We maintain HUNDREDS of open source projects. This is how we maintain our sanity.)
  **





-->

Terraform module to provision an AWS Key Management Service (KMS) Customer Managed Key (CMK)
for Route53 DNS to use as a Key-signing Key (KSK) for enabling DNSSEC on a Hosted Zone.

Provides the ability to instantiate a single KMS key to be used for multiple hosted zones.

The KSK is setup using a random string. The CMK has an AWS recommended IAM key policy applied
to it and is created as an Asymmetric ECC_NIST_P256/ECDSA_SHA_256 key as required.

**IMPORTANT:** Route53 requires the KMS key be provisioned in the `us-east-1` region. If including
within a root module configured in another region then a provider alias must be passwd when using this
module.

---

This project is part of our comprehensive approach towards DevOps.
[<img align="right" title="Share via Email" src="https://docs.cloudposse.com/images/ionicons/ios-email-outline-2.0.1-16x16-999999.svg"/>][share_email]
[<img align="right" title="Share on Google+" src="https://docs.cloudposse.com/images/ionicons/social-googleplus-outline-2.0.1-16x16-999999.svg" />][share_googleplus]
[<img align="right" title="Share on Facebook" src="https://docs.cloudposse.com/images/ionicons/social-facebook-outline-2.0.1-16x16-999999.svg" />][share_facebook]
[<img align="right" title="Share on Reddit" src="https://docs.cloudposse.com/images/ionicons/social-reddit-outline-2.0.1-16x16-999999.svg" />][share_reddit]
[<img align="right" title="Share on LinkedIn" src="https://docs.cloudposse.com/images/ionicons/social-linkedin-outline-2.0.1-16x16-999999.svg" />][share_linkedin]
[<img align="right" title="Share on Twitter" src="https://docs.cloudposse.com/images/ionicons/social-twitter-outline-2.0.1-16x16-999999.svg" />][share_twitter]

Designed following the [Cloud Posse, LLC][cloudposse] ["SweetOps"][sweetops] approach.


[![Terraform Open Source Modules](https://docs.cloudposse.com/images/terraform-open-source-modules.svg)][terraform_modules]



It's 100% Open Source and licensed under the [APACHE2](LICENSE).







We literally have [*hundreds of terraform modules*][terraform_modules] that are Open Source and well-maintained. Check them out!





## Introduction




## Security & Compliance [<img src="https://bridgecrew.io/wp-content/themes/bridgecrew/assets/images/bc-by-pc-color.svg" width="250" align="right" />](https://bridgecrew.io/)

Security scanning provided by Bridgecrew. Bridgecrew is the leading fully hosted, cloud-native solution providing continuous Terraform security and compliance.

| Benchmark | Description |
|--------|---------------|
| [![Infrastructure Security](https://www.bridgecrew.cloud/badges/github/ugns/terraform-aws-route53-dnssec/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=ugns%2Fterraform-aws-route53-dnssec&benchmark=INFRASTRUCTURE+SECURITY) | Infrastructure Security Compliance |
| [![CIS KUBERNETES](https://www.bridgecrew.cloud/badges/github/ugns/terraform-aws-route53-dnssec/cis_kubernetes)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=ugns%2Fterraform-aws-route53-dnssec&benchmark=CIS+KUBERNETES+V1.5) | Center for Internet Security, KUBERNETES Compliance |
| [![CIS AWS](https://www.bridgecrew.cloud/badges/github/ugns/terraform-aws-route53-dnssec/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=ugns%2Fterraform-aws-route53-dnssec&benchmark=CIS+AWS+V1.2) | Center for Internet Security, AWS Compliance |
| [![CIS AZURE](https://www.bridgecrew.cloud/badges/github/ugns/terraform-aws-route53-dnssec/cis_azure)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=ugns%2Fterraform-aws-route53-dnssec&benchmark=CIS+AZURE+V1.1) | Center for Internet Security, AZURE Compliance |
| [![PCI-DSS](https://www.bridgecrew.cloud/badges/github/ugns/terraform-aws-route53-dnssec/pci)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=ugns%2Fterraform-aws-route53-dnssec&benchmark=PCI-DSS+V3.2) | Payment Card Industry Data Security Standards Compliance |
| [![NIST-800-53](https://www.bridgecrew.cloud/badges/github/ugns/terraform-aws-route53-dnssec/nist)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=ugns%2Fterraform-aws-route53-dnssec&benchmark=NIST-800-53) | National Institute of Standards and Technology Compliance |
| [![ISO27001](https://www.bridgecrew.cloud/badges/github/ugns/terraform-aws-route53-dnssec/iso)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=ugns%2Fterraform-aws-route53-dnssec&benchmark=ISO27001) | Information Security Management System, ISO/IEC 27001 Compliance |
| [![SOC2](https://www.bridgecrew.cloud/badges/github/ugns/terraform-aws-route53-dnssec/soc2)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=ugns%2Fterraform-aws-route53-dnssec&benchmark=SOC2)| Service Organization Control 2 Compliance |
| [![CIS GCP](https://www.bridgecrew.cloud/badges/github/ugns/terraform-aws-route53-dnssec/cis_gcp)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=ugns%2Fterraform-aws-route53-dnssec&benchmark=CIS+GCP+V1.1) | Center for Internet Security, GCP Compliance |
| [![HIPAA](https://www.bridgecrew.cloud/badges/github/ugns/terraform-aws-route53-dnssec/hipaa)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=ugns%2Fterraform-aws-route53-dnssec&benchmark=HIPAA) | Health Insurance Portability and Accountability Compliance |



## Usage


**IMPORTANT:** We do not pin modules to versions in our examples because of the
difficulty of keeping the versions in the documentation in sync with the latest released versions.
We highly recommend that in your code you pin the version to the exact version you are
using so that your infrastructure remains stable, and update versions in a
systematic way so that they do not catch you by surprise.

Also, because of a bug in the Terraform registry ([hashicorp/terraform#21417](https://github.com/hashicorp/terraform/issues/21417)),
the registry shows many of our inputs as required when in fact they are optional.
The table below correctly indicates which inputs are required.



### Major Changes (breaking and otherwise)

With the v1.0.0 release of this module, it has undergone major breaking changes and added
new functionality. Efforts were made to not create these breaking changes but they were
unavailable due to the nature of the issues fixed. Please see the [migration](MIGRATION.md)
document for details.

For a complete example, see [examples/complete](examples/complete).

For automated tests of the complete example using [bats](https://github.com/bats-core/bats-core) 
and [Terratest](https://github.com/gruntwork-io/terratest)
(which tests and deploys the example on AWS), see [test](test).

```hcl
# Create a standard label resource. See [null-label](https://github.com/cloudposse/terraform-null-label/#terraform-null-label--)
module "label" {
  source  = "cloudposse/label/null"
  # Cloud Posse recommends pinning every module to a specific version, though usually you want to use the current one
  # version = "x.x.x"

  namespace = "eg"
  name      = "example"
}

module "example" {
  source  = "ugns/route53-dnssec/aws"
  # Cloud Posse recommends pinning every module to a specific version
  # version = "x.x.x"

  zones = {
    "example.com" = {
      zone_id = "Z8VLZEXAMPLE"
    }
  }

  context = module.label.this
}
```




## Examples

Here is an example of using this module:
- [`examples/complete`](https://github.com/ugns/terraform-aws-route53-dnssec/tree/main/examples/complete) - complete example of using this module



<!-- markdownlint-disable -->
## Makefile Targets
```text
Available targets:

  help                                Help screen
  help/all                            Display help for all targets
  help/short                          This help short screen
  lint                                Lint terraform code

```
<!-- markdownlint-restore -->
<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.71.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kms_key"></a> [kms\_key](#module\_kms\_key) | cloudposse/kms-key/aws | 0.12.1 |
| <a name="module_this"></a> [this](#module\_this) | cloudposse/label/null | 0.25.0 |

## Resources

| Name | Type |
|------|------|
| [aws_route53_key_signing_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_key_signing_key) | resource |
| [random_string.ksk](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [aws_caller_identity.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.ksk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tag_map"></a> [additional\_tag\_map](#input\_additional\_tag\_map) | Additional key-value pairs to add to each map in `tags_as_list_of_maps`. Not added to `tags` or `id`.<br>This is for some rare cases where resources want additional configuration of tags<br>and therefore take a list of maps with tag key, value, and additional configuration. | `map(string)` | `{}` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | ID element. Additional attributes (e.g. `workers` or `cluster`) to add to `id`,<br>in the order they appear in the list. New attributes are appended to the<br>end of the list. The elements of the list are joined by the `delimiter`<br>and treated as a single ID element. | `list(string)` | `[]` | no |
| <a name="input_context"></a> [context](#input\_context) | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | `any` | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "descriptor_formats": {},<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_key_case": null,<br>  "label_order": [],<br>  "label_value_case": null,<br>  "labels_as_tags": [<br>    "unset"<br>  ],<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {},<br>  "tenant": null<br>}</pre> | no |
| <a name="input_deletion_window_in_days"></a> [deletion\_window\_in\_days](#input\_deletion\_window\_in\_days) | (Optional) The waiting period, specified in number of days. <br>After the waiting period ends, AWS KMS deletes the KMS key.<br>If you specify a value, it must be between 7 and 30, inclusive.<br>Defaults to `7`. | `number` | `7` | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between ID elements.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| <a name="input_descriptor_formats"></a> [descriptor\_formats](#input\_descriptor\_formats) | Describe additional descriptors to be output in the `descriptors` output map.<br>Map of maps. Keys are names of descriptors. Values are maps of the form<br>`{<br>   format = string<br>   labels = list(string)<br>}`<br>(Type is `any` so the map values can later be enhanced to provide additional options.)<br>`format` is a Terraform format string to be passed to the `format()` function.<br>`labels` is a list of labels, in order, to pass to `format()` function.<br>Label values will be normalized before being passed to `format()` so they will be<br>identical to how they appear in `id`.<br>Default is `{}` (`descriptors` output will be empty). | `any` | `{}` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| <a name="input_id_length_limit"></a> [id\_length\_limit](#input\_id\_length\_limit) | Limit `id` to this many characters (minimum 6).<br>Set to `0` for unlimited length.<br>Set to `null` for keep the existing setting, which defaults to `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| <a name="input_label_key_case"></a> [label\_key\_case](#input\_label\_key\_case) | Controls the letter case of the `tags` keys (label names) for tags generated by this module.<br>Does not affect keys of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper`.<br>Default value: `title`. | `string` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | The order in which the labels (ID elements) appear in the `id`.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 6 labels ("tenant" is the 6th), but at least one must be present. | `list(string)` | `null` | no |
| <a name="input_label_value_case"></a> [label\_value\_case](#input\_label\_value\_case) | Controls the letter case of ID elements (labels) as included in `id`,<br>set as tag values, and output by this module individually.<br>Does not affect values of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper` and `none` (no transformation).<br>Set this to `title` and set `delimiter` to `""` to yield Pascal Case IDs.<br>Default value: `lower`. | `string` | `null` | no |
| <a name="input_labels_as_tags"></a> [labels\_as\_tags](#input\_labels\_as\_tags) | Set of labels (ID elements) to include as tags in the `tags` output.<br>Default is to include all labels.<br>Tags with empty values will not be included in the `tags` output.<br>Set to `[]` to suppress all generated tags.<br>**Notes:**<br>  The value of the `name` tag, if included, will be the `id`, not the `name`.<br>  Unlike other `null-label` inputs, the initial setting of `labels_as_tags` cannot be<br>  changed in later chained modules. Attempts to change it will be silently ignored. | `set(string)` | <pre>[<br>  "default"<br>]</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | ID element. Usually the component or solution name, e.g. 'app' or 'jenkins'.<br>This is the only ID element not also included as a `tag`.<br>The "name" tag is set to the full `id` string. There is no tag with the value of the `name` input. | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | ID element. Usually an abbreviation of your organization name, e.g. 'eg' or 'cp', to help ensure generated IDs are globally unique | `string` | `null` | no |
| <a name="input_regex_replace_chars"></a> [regex\_replace\_chars](#input\_regex\_replace\_chars) | Terraform regular expression (regex) string.<br>Characters matching the regex will be removed from the ID elements.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | ID element. Usually used to indicate role, e.g. 'prod', 'staging', 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `{'BusinessUnit': 'XYZ'}`).<br>Neither the tag keys nor the tag values will be modified by this module. | `map(string)` | `{}` | no |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | ID element \_(Rarely used, not included by default)\_. A customer identifier, indicating who this instance of a resource is for | `string` | `null` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | (Optional) A map of hosted zones with `zone_id` to assign the<br>KSK to in the format of:<pre>{<br>  "example.com" = {<br>      zone_id = "Z8VLZEXAMPLE"<br>  }<br>}</pre>Defaults to `{}` which will generate the KMS key and alias but<br>not assign it to a hosted zone which can be useful for staging. | `map(map(string))` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_arn"></a> [key\_arn](#output\_key\_arn) | KMS key arn for Route53 DNSSEC CMK |
| <a name="output_this_key_arn"></a> [this\_key\_arn](#output\_this\_key\_arn) | Deprecated: KMS key arn for Route53 DNSSEC CMK |
<!-- markdownlint-restore -->



## Share the Love

Like this project? Please give it a ★ on [our GitHub](https://github.com/ugns/terraform-aws-route53-dnssec)! (it helps us **a lot**)



## Related Projects

Check out these related projects.

- [terraform-null-label](https://github.com/cloudposse/terraform-null-label) - Terraform module designed to generate consistent names and tags for resources. Use terraform-null-label to implement a strict naming convention.


## References

For additional context, refer to some of these links.

- [domain-configure-dnssec](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-configure-dnssec.html) - AWS Route53 Developers Guide: Configuring DNSSEC for a domain
- [dns-configuring-dnssec](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-configuring-dnssec.html) - AWS Route53 Developers Guide: Configuring DNSSEC signing in Amazone Route 53


## Help

**Got a question?** We got answers.

File a GitHub [issue](https://github.com/ugns/terraform-aws-route53-dnssec/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/ugns/terraform-aws-route53-dnssec/issues) to report any bugs or file feature requests.

### Developing

If you are interested in being a contributor and want to get involved in developing this project or help out with our other projects, we would love to hear from you!.

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

 1. **Fork** the repo on GitHub
 2. **Clone** the project to your own machine
 3. **Commit** changes to your own branch
 4. **Push** your work back up to your fork
 5. Submit a **Pull Request** so that we can review your changes

**NOTE:** Be sure to merge the latest changes from "upstream" before making a pull request!



## Copyrights

Copyright © 2021-2022 [UnderGrid Network Services](https://undergrid.net)





## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

```text
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

  https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
```









## Trademarks

All other trademarks referenced herein are the property of their respective owners.

## About

This project is maintained and funded by [UnderGrid Network Services][website]. Like it? Please let us know!

[![UnderGrid Network Services][logo]][website]

We're a DevOps Professional Services consulting firm based in Kissimmee, FL.

Check out [our other projects][github].


### Contributors

<!-- markdownlint-disable -->
|  [![Jeremy T. Bouse][jbouse_avatar]][jbouse_homepage]<br/>[Jeremy T. Bouse][jbouse_homepage] |
|---|
<!-- markdownlint-restore -->

  [jbouse_homepage]: https://github.com/jbouse
  [jbouse_avatar]: https://img.cloudposse.com/150x150/https://github.com/jbouse.png

[![Beacon][beacon]][website]

  [logo]: https://undergrid.net/undergrid-logo-300x88.png
  [docs]: https://cpco.io/docs?utm_source=github&utm_medium=readme&utm_campaign=ugns/terraform-aws-route53-dnssec&utm_content=docs
  [website]: https://undergrid.net?utm_source=github&utm_medium=readme&utm_campaign=ugns/terraform-aws-route53-dnssec&utm_content=website
  [cloudposse]: https://cpco.io/homepage?utm_source=github&utm_medium=readme&utm_campaign=ugns/terraform-aws-route53-dnssec&utm_content=cloudposse
  [sweetops]: https://cpco.io/sweetops?utm_source=github&utm_medium=readme&utm_campaign=ugns/terraform-aws-route53-dnssec&utm_content=sweetops
  [github]: https://github.com/ugns?utm_source=github&utm_medium=readme&utm_campaign=ugns/terraform-aws-route53-dnssec&utm_content=github
  [linkedin]: https://www.linkedin.com/company/undergrid-network-services/?utm_source=github&utm_medium=readme&utm_campaign=ugns/terraform-aws-route53-dnssec&utm_content=linkedin
  [email]: https://cpco.io/email?utm_source=github&utm_medium=readme&utm_campaign=ugns/terraform-aws-route53-dnssec&utm_content=email
  [terraform_modules]: https://github.com/ugns?utm_source=github&utm_medium=readme&utm_campaign=ugns/terraform-aws-route53-dnssec&utm_content=terraform_modules
  [share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-route53-dnssec&url=https://github.com/ugns/terraform-aws-route53-dnssec
  [share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-route53-dnssec&url=https://github.com/ugns/terraform-aws-route53-dnssec
  [share_reddit]: https://reddit.com/submit/?url=https://github.com/ugns/terraform-aws-route53-dnssec
  [share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/ugns/terraform-aws-route53-dnssec
  [share_googleplus]: https://plus.google.com/share?url=https://github.com/ugns/terraform-aws-route53-dnssec
  [share_email]: mailto:?subject=terraform-aws-route53-dnssec&body=https://github.com/ugns/terraform-aws-route53-dnssec
  [beacon]: https://ga-beacon.cloudposse.com/UA-2819624-1/ugns/terraform-aws-route53-dnssec?pixel&cs=github&cm=readme&an=terraform-aws-route53-dnssec
