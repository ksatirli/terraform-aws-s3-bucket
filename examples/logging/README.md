# Example: `logging`

> This is an example of a _logging_ configuration of the [terraform-aws-s3-bucket Module](https://registry.terraform.io/modules/operatehappy/s3-bucket/)

## Table of Contents

- [Example: `logging`](#example-logging)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Module Variables and Outputs](#module-variables-and-outputs)

## Installation

For a list of installation instructions, see the [Readme document](https://registry.terraform.io/modules/operatehappy/s3-bucket/) on the Terraform Registry.

## Usage

A _logging_ configuration of the `terraform-aws-s3-bucket` Module could look like this:

```hcl
// create S3 Bucket to be used as logging target
module "logging_example_target" {
  source  = "operatehappy/s3-bucket/aws"
  version = "1.2.0"
  name    = "oh-demos-logging-example-target"
  acl     = "log-delivery-write"
}

module "logging_example" {
  source  = "operatehappy/s3-bucket/aws"
  version = "1.2.0"

  name = "oh-demos-logging-example"

  logging = {
    target_bucket = module.logging-example-target.id
    target_prefix = "logs"
  }
}
```

## Module Variables and Outputs

For a list of available variables and outputs, see the [Readme document](https://registry.terraform.io/modules/operatehappy/s3-bucket/) on the Terraform Registry.

A copy of this document (as `README.md`) is also available on [GitHub](https://github.com/operatehappy/terraform-aws-s3-bucket/blob/master/README.md#readme).
