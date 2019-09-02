resource "aws_s3_bucket" "bucket" {
  bucket        = local.name
  bucket_prefix = local.bucket_prefix
  acl           = var.acl
  policy        = local.policy
  tags          = local.tags
  force_destroy = var.force_destroy
}

resource "aws_s3_bucket_object" "readme" {
  count   = var.create_readme ? 1 : 0
  bucket  = aws_s3_bucket.bucket.id
  key     = "README.md"
  content = templatefile("${path.module}/files/README.md", { ADDITIONAL_CONTENT = var.readme_additions })
}
