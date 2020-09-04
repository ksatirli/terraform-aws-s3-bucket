module "simple_example" {
  source  = "operatehappy/s3-bucket/aws"
  version = "1.2.0"

  name = "oh-demos-simple-example"

  tags = {
    Department = "Operations"
  }

  force_destroy = true

  create_readme = false
}
