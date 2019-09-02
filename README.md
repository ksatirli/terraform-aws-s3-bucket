# Terraform Module: AWS S3 Bucket DNS Records

> This repository is a [Terraform](https://terraform.io/) Module for managing AWS [S3 Bucket](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingBucket.html) for AWS WorkMail Organizations.

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
  version = "1.0.0"

  name = "oh-demo-simple-example"

  tags = {
    Department = "Operations"
  }

  force_destroy = true

  create_readme = false
}

```

Then, fetch the module from the [Terraform Registry](https://registry.terraform.io/modules/operatehappy/s3-bucket) using `terraform get`.

### Module Outputs

Available outputs are listed below, along with their description

| output          | description                                                         |
|-----------------|---------------------------------------------------------------------|
| `default_tags`  | default tags containing Terraform Workspace identifier              |
| `merged_tags`   | merged value of `var.tags` and `local.default_tags` _or_ `var.tags` |
| `name`          | value of `var.name` or `null`                                       |
| `bucket_prefix` | value of `var.name` or `null`                                       |
| `policy`        | value of `var.policy` or `null`                                     |

## Author Information

This module is currently maintained by the individuals listed below.

- [Kerim Satirli](https://github.com/ksatirli)

Development of this module was sponsored by [Operate Happy](https://github.com/operatehappy).

## License

Copyright 2019 [Kerim Satirli](https://github.com/ksatirli)

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
