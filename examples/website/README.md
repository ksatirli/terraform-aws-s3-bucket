# Example: `website`

> This is an example of a _website_ configuration of the [terraform-aws-s3-bucket Module](https://registry.terraform.io/modules/operatehappy/s3-bucket/)

## Table of Contents

- [Example: `website`](#example-website)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Module Variables and Outputs](#module-variables-and-outputs)

## Installation

For a list of installation instructions, see the [Readme document](https://registry.terraform.io/modules/operatehappy/s3-bucket/) on the Terraform Registry.

## Usage

A _website_ configuration of the `terraform-aws-s3-bucket` Module could look like this:

```hcl
module "website-example" {
  source  = "operatehappy/s3-bucket/aws"
  version = "1.1.4"

  name   = "oh-demos-website-example"

  website = [{
    index_document           = "index.html"
    error_document           = "error.html"
    routing_rules            = <<EOF
    [{
        "Condition": {
            "KeyPrefixEquals": "img/"
        },
        "Redirect": {
            "ReplaceKeyPrefixWith": "images/"
        }
    }]
    EOF
    redirect_all_requests_to = null
  }]

  cors_rule = {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "PUT", "HEAD", "POST", "DELETE"]
    allowed_origins = ["https://example.com"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3600
  }
}
```

## Module Variables and Outputs

For a list of available variables and outputs, see the [Readme document](https://registry.terraform.io/modules/operatehappy/s3-bucket/) on the Terraform Registry.

A copy of this document (as `README.md`) is also available on [GitHub](https://github.com/operatehappy/terraform-aws-s3-bucket/blob/master/README.md#readme).
