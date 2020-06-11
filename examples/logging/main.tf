module "logging-example-target" {
  source  = "operatehappy/s3-bucket/aws"
  version = "1.1.4"
  name    = "oh-demos-logging-example-target"
  acl     = "log-delivery-write"
}

module "logging-example" {
  source  = "operatehappy/s3-bucket/aws"
  version = "1.1.4"

  name = "oh-demos-logging-example"

  logging = {
    target_bucket = module.logging-example-target.id
    target_prefix = "logs"
  }
}
