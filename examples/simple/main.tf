module "simple-example" {
  source  = "operatehappy/s3-bucket/aws"
  version = "1.0.0"

  name = "oh-demo-simple-example"

  tags = {
    Department = "Operations"
  }

  force_destroy = true

  create_readme = false
}
