locals {
  default_tags = {
    TerraformManaged   = true
    TerraformWorkspace = terraform.workspace
  }
  // if `use_default_tags` is set to `true`, merge `tags` with `default_tags`
  // otherwise, use user-supplied `tags` mapping
  merged_tags = var.use_default_tags ? merge(var.tags, local.default_tags) : var.tags

  // if `use_prefix` is set to `true`, set `bucket_name` to `null`
  // thereby allowing Terraform to set the `bucket_prefix`
  name = var.use_prefix ? null : var.name

  // if `use_prefix` is set to `false`, set `bucket_prefix` to `null`
  // thereby allowing Terraform to set the `bucket_name`
  bucket_prefix = var.use_prefix ? var.name : null

  policy = var.policy != null ? var.policy : null

  tags = local.merged_tags != null ? local.merged_tags : null

  region = var.region != null ? var.region : null
}
