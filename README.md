# Terraform Module: AWS S3 Bucket DNS Records

> This repository is a [Terraform](https://terraform.io/) Module for managing AWS [S3 Bucket](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingBucket.html) for AWS S3 Buckets.

## Table of Contents

- [Terraform Module: AWS S3 Bucket DNS Records](#terraform-module-aws-s3-bucket-dns-records)
  - [Table of Contents](#table-of-contents)
  - [Requirements](#requirements)
  - [Dependencies](#dependencies)
  - [Usage](#usage)
    - [Module Variables](#module-variables)
    - [Module Outputs](#module-outputs)
  - [Author Information](#author-information)
  - [License](#license)

## Requirements

This module requires Terraform version `0.12.0` or newer.

## Dependencies

This module depends on a correctly configured [AWS Provider](https://www.terraform.io/docs/providers/aws/index.html) in your Terraform codebase.

## Usage

Add the module to your Terraform resources like so:

```hcl
module "simple-example" {
  source  = "operatehappy/s3-bucket/aws"
  version = "1.1.0"

  name = "oh-demo-simple-example"

  tags = {
    Department = "Operations"
  }

  force_destroy = true

  create_readme = false
}
```

Then, fetch the module from the [Terraform Registry](https://registry.terraform.io/modules/operatehappy/s3-bucket) using `terraform get`.

Additional usage examples are avaialble in the `examples` directory via [GitHub](https://github.com/operatehappy/terraform-aws-s3-bucket/tree/master/examples).

### Module Variables

Available variables are listed below, along with their default values:

| variable                               | type          | description                                                                          | default         |
|----------------------------------------|---------------|--------------------------------------------------------------------------------------|-----------------|
| `name`                                 | `string`      | Name of S3 Bucket                                                                    |                 |
| `use_prefix`                           | `bool`        | Toggle to use randomly-generated Prefix for Bucket Name                              | `false`         |
| `acl`                                  | `string`      | Canned ACL of S3 Bucket                                                              | `"private"`     |
| `policy`                               | `string`      | Policy (JSON) Document of S3 Bucket                                                  | `null`          |
| `use_default_tags`                     | `bool`        | Toggle to enable creation of default tags, containing Terraform Workspace identifier | `true`          |
| `tags`                                 | `map`         | Mapping of Tags of S3 Bucket                                                         | `{}`            |
| `force_destroy`                        | `bool`        | Toggle to enable force-destruction of S3 Bucket                                      | `false`         |
| `website`                              | `map(string)` | Map of Website configuration of S3 Bucket                                            | `{}`            |
| `cors_rule`                            | `any`         | Map of CORS Rules of S3 Bucket                                                       | `{}`            |
| `versioning`                           | `map(string)` | Map of Versionining configuration of S3 Bucket                                       | `{}`            |
| `logging`                              | `map(string)` | Map of Logging configuration of S3 Bucket                                            | `{}`            |
| `lifecycle_rule`                       | `list`        | Map of Lifecycle Rule configuration of S3 Bucket                                     | `[]`            |
| `acceleration_status`                  | `string`      | Acceleration Status of S3 Bucket                                                     | `null`          |
| `request_payer`                        | `string`      | Identifier for Request Cost-allocation of S3 Bucket                                  | `"BucketOwner"` |
| `region`                               | `string`      | Region of S3 Bucket                                                                  | `null`          |
| `server_side_encryption_configuration` | `map`         | Server-side Encryption (SSE) Configuration of S3 Bucket                              | `{}`            |
| `object_lock_configuration`            | `any`         | Object-lock Configuration of S3 Bucket                                               | `{}`            |
| `create_readme`                        | `bool`        | Toggle creation of `README.md` in root of S3 Bucket                                  | `true`          |
| `readme_additions`                     | `string`      | Additional content (e.g.: information, instructions) to add to README.md             | `""`            |

Additionally, the following variables are generated as [locals](https://www.terraform.io/docs/configuration/locals.html):

| key             | value                                                               |
|-----------------|---------------------------------------------------------------------|
| `default_tags`  | default tags containing Terraform Workspace identifier              |
| `merged_tags`   | merged value of `var.tags` and `local.default_tags` _or_ `var.tags` |
| `name`          | value of `var.name` or `null`                                       |
| `bucket_prefix` | value of `var.name` or `null`                                       |

### Module Outputs

Available outputs are listed below, along with their description

| output                        | description                                  |
|-------------------------------|----------------------------------------------|
| `id`                          | Name of the Bucket                           |
| `arn`                         | ARN of the Bucket                            |
| `bucket_domain_name`          | Domain name of the Bucket                    |
| `bucket_regional_domain_name` | Region-specific domain name of the Bucket    |
| `hosted_zone_id`              | Hosted Zone ID of the Bucket's Region        |
| `region`                      | Region of the Bucket                         |
| `website_endpoint`            | Website Endpoint of the Bucket               |
| `website_domain`              | Domain of the Website Endpoint of the Bucket |
| `readme_id`                   | Key of the README file                       |
| `readme_etag`                 | ETag of the README file                      |
| `readme_version_id`           | Version ID of the README file                |

## Author Information

This module is maintained by the contributors listed on [GitHub](https://github.com/operatehappy/terraform-aws-s3-bucket/graphs/contributors)

Development of this module was sponsored by [Operate Happy](https://github.com/operatehappy).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
