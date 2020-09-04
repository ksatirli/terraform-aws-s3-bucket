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
