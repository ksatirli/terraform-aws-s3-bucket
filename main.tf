resource "aws_s3_bucket" "bucket" {
  bucket        = local.name
  bucket_prefix = local.bucket_prefix
  acl           = var.acl
  policy        = var.policy != null ? var.policy : null
  tags          = local.merged_tags
  force_destroy = var.force_destroy

  dynamic "website" {
    for_each = length(var.website) != 0 ? [var.website] : []

    content {
      index_document           = lookup(website.value, "index_document", null)
      error_document           = lookup(website.value, "error_document", null)
      routing_rules            = lookup(website.value, "routing_rules", null)
      redirect_all_requests_to = lookup(website.value, "redirect_all_requests_to", null)
    }
  }

  dynamic "cors_rule" {
    for_each = length(var.cors_rule) != 0 ? [var.cors_rule] : []

    content {
      allowed_headers = lookup(cors_rule.value, "allowed_headers", null)
      allowed_methods = lookup(cors_rule.value, "allowed_methods", null)
      allowed_origins = lookup(cors_rule.value, "allowed_origins", null)
      expose_headers  = lookup(cors_rule.value, "expose_headers", null)
      max_age_seconds = lookup(cors_rule.value, "max_age_seconds", null)
    }
  }

  dynamic "versioning" {
    for_each = length(var.versioning) != 0 ? [var.versioning] : []

    content {
      enabled    = lookup(versioning.value, "enabled", null)
      mfa_delete = lookup(versioning.value, "mfa_delete", null)
    }
  }

  dynamic "logging" {
    for_each = length(var.logging) != 0 ? [var.logging] : []

    content {
      target_bucket = lookup(logging.value, "target_bucket", null)
      target_prefix = lookup(logging.value, "target_prefix", null)
    }
  }

  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rule

    content {
      id                                     = lookup(lifecycle_rule.value, "id", null)
      prefix                                 = lookup(lifecycle_rule.value, "prefix", null)
      tags                                   = lookup(lifecycle_rule.value, "tags", null)
      enabled                                = lookup(lifecycle_rule.value, "enabled", false)
      abort_incomplete_multipart_upload_days = lookup(lifecycle_rule.value, "abort_incomplete_multipart_upload_days", null)

      dynamic "expiration" {
        // TODO: simplify this:
        for_each = length(keys(lookup(lifecycle_rule.value, "expiration", {}))) == 0 ? [] : [lookup(lifecycle_rule.value, "expiration", {})]

        content {
          date                         = lookup(expiration.value, "date", null)
          days                         = lookup(expiration.value, "days", null)
          expired_object_delete_marker = lookup(expiration.value, "expired_object_delete_marker", null)
        }
      }

      dynamic "transition" {
        // TODO: simplify this:
        for_each = length(keys(lookup(lifecycle_rule.value, "transition", {}))) == 0 ? [] : [lookup(lifecycle_rule.value, "transition", {})]

        content {
          date          = lookup(transition.value, "date", null)
          days          = lookup(transition.value, "days", null)
          storage_class = lookup(transition.value, "storage_class", null)
        }
      }

      dynamic "noncurrent_version_expiration" {
        // TODO: simplify this:
        for_each = length(keys(lookup(lifecycle_rule.value, "noncurrent_version_expiration", {}))) == 0 ? [] : [lookup(lifecycle_rule.value, "noncurrent_version_expiration", {})]

        content {
          days = lookup(noncurrent_version_expiration.value, "days", null)
        }
      }

      dynamic "noncurrent_version_transition" {
        // TODO: simplify this:
        for_each = length(keys(lookup(lifecycle_rule.value, "noncurrent_version_transition", {}))) == 0 ? [] : [lookup(lifecycle_rule.value, "noncurrent_version_transition", {})]

        content {
          days          = lookup(lifecycle_rule.value.noncurrent_version_transition, "days", null)
          storage_class = lookup(lifecycle_rule.value.noncurrent_version_transition, "storage_class", null)
        }
      }
    }
  }

  acceleration_status = var.acceleration_status

  request_payer = var.request_payer

  // replication_configuration will be added in a future release

  dynamic "server_side_encryption_configuration" {
    for_each = length(var.server_side_encryption_configuration) != 0 ? [var.server_side_encryption_configuration] : []

    content {
      rule {
        apply_server_side_encryption_by_default {
          kms_master_key_id = lookup(server_side_encryption_configuration.value, "kms_master_key_id", null)
          sse_algorithm     = lookup(server_side_encryption_configuration.value, "sse_algorithm", null)
        }
      }
    }
  }

  dynamic "object_lock_configuration" {
    for_each = length(var.object_lock_configuration) != 0 ? [var.object_lock_configuration] : []

    content {
      object_lock_enabled = lookup(object_lock_configuration.value, "object_lock_enabled", null)

      dynamic "rule" {
        for_each = length(var.object_lock_configuration.rule) != 0 ? [var.object_lock_configuration.rule] : []

        content {
          default_retention {
            mode  = lookup(rule.value.default_retention, "mode", null)
            days  = lookup(rule.value.default_retention, "days", null)
            years = lookup(rule.value.default_retention, "years", null)
          }
        }
      }
    }
  }
}

resource "aws_s3_bucket_object" "readme" {
  count   = var.create_readme ? 1 : 0
  bucket  = aws_s3_bucket.bucket.id
  key     = "README.md"
  content = templatefile("${path.module}/files/README.tpl.md", { ADDITIONAL_CONTENT = var.readme_additions })
}
