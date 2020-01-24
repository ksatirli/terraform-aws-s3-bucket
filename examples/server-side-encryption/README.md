# Example: `server-side-encryption`

> This is an example of a _server-side-encryption_ configuration of the [terraform-aws-s3-bucket Module](https://registry.terraform.io/modules/operatehappy/s3-bucket/)

## Table of Contents

- [Example: `server-side-encryption`](#example-server-side-encryption)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Module Variables and Outputs](#module-variables-and-outputs)

## Installation

For a list of installation instructions, see the [Readme document](https://registry.terraform.io/modules/operatehappy/s3-bucket/) on the Terraform Registry.

## Usage

A _server-side-encryption_ configuration of the `terraform-aws-s3-bucket` Module could look like this:

```hcl
module "server-side-encryption-example" {
  source  = "operatehappy/s3-bucket/aws"
  version = "1.1.0"

  name   = "oh-demos-server-side-encryption-example"

  server_side_encryption_configuration = {
    kms_master_key_id = "alias/oh-demos"
    sse_algorithm     = "aws:kms"
  }
}
```

## Module Variables and Outputs

For a list of available variables and outputs, see the [Readme document](https://registry.terraform.io/modules/operatehappy/s3-bucket/) on the Terraform Registry.

A copy of this document (as `README.md`) is also available on [GitHub](https://github.com/operatehappy/terraform-aws-s3-bucket/blob/master/README.md#readme).
