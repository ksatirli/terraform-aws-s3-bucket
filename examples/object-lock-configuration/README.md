# Example: `object-lock`

> This is an example of an _object-lock_ configuration of the [terraform-aws-s3-bucket Module](https://registry.terraform.io/modules/operatehappy/s3-bucket/)

## Table of Contents

- [Example: `object-lock`](#example-object-lock)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Module Variables and Outputs](#module-variables-and-outputs)

## Installation

For a list of installation instructions, see the [Readme document](https://registry.terraform.io/modules/operatehappy/s3-bucket/) on the Terraform Registry.

## Usage

An _object-lock_ configuration of the `terraform-aws-s3-bucket` Module could look like this:

```hcl
module "object-lock-configuration-example" {
  source  = "operatehappy/s3-bucket/aws"
  version = "1.0.0"

  name = "oh-demos-object-lock-configuration-example"

  object_lock_configuration = {
    object_lock_enabled = "Enabled"

    rule = {
      default_retention = {
        mode = "GOVERNANCE"
        days = 366
      }
    }
  }
}
```

## Module Variables and Outputs

For a list of available variables and outputs, see the [Readme document](https://registry.terraform.io/modules/operatehappy/s3-bucket/) on the Terraform Registry.

A copy of this document (as `README.md`) is also available on [GitHub](https://github.com/operatehappy/terraform-aws-s3-bucket/blob/master/README.md#readme).
