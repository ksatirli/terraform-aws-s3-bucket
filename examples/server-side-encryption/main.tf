module "server-side-encryption-example" {
  source  = "operatehappy/s3-bucket/aws"
  version = "1.1.4"

  name = "oh-demos-server-side-encryption-example"

  server_side_encryption_configuration = {
    kms_master_key_id = "alias/oh-demos"
    sse_algorithm     = "aws:kms"
  }
}
