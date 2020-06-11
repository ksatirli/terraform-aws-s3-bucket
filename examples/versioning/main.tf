module "versioning-example" {
  source  = "operatehappy/s3-bucket/aws"
  version = "1.1.4"

  name = "oh-demos-versioning-example"

  versioning = {
    enabled    = true
    mfa_delete = false
  }
}
