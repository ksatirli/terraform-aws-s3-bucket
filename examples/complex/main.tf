module "complex_example_target" {
  source  = "operatehappy/s3-bucket/aws"
  version = "1.2.0"
  name    = "oh-demos-complex-example-target"
  acl     = "log-delivery-write"

  server_side_encryption_configuration = [{
    kms_master_key_id = "alias/oh-demos"
    sse_algorithm     = "aws:kms"
  }]
}

module "complex_example" {
  source  = "operatehappy/s3-bucket/aws"
  version = "1.2.0"

  name = "oh-demos-complex-example"

  tags = {
    Department = "Operations"
  }

  force_destroy = true

  versioning = [{
    enabled    = true
    mfa_delete = false
  }]

  logging = [{
    target_bucket = module.complex-example-target.id
    target_prefix = "logs"
  }]

  server_side_encryption_configuration = [{
    kms_master_key_id = "alias/oh-demos"
    sse_algorithm     = "aws:kms"
  }]
}
