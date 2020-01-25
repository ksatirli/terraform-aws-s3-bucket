module "simple-example" {
  source  = "operatehappy/s3-bucket/aws"
  version = "1.1.1"

  name = "oh-demos-simple-example"

  tags = {
    Department = "Operations"
  }

  force_destroy = true

  create_readme = false
}
