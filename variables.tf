variable "name" {
  type        = string
  description = "Name of S3 Bucket"
}

variable "use_prefix" {
  type        = bool
  description = "Toggle to use randomly-generated Prefix for Bucket Name"
  default     = false
}

variable "acl" {
  type        = string
  description = "Canned ACL of S3 Bucket"
  default     = "private"
}

variable "policy" {
  type        = string
  description = "Policy (JSON) Document of S3 Bucket"
  default     = null
}

variable "use_default_tags" {
  type        = bool
  description = "Toggle to enable creation of default tags, containing Terraform Workspace identifier"
  default     = true
}

variable "tags" {
  type        = map
  description = "Mapping of Tags of S3 Bucket"
  default     = {}
}

variable "force_destroy" {
  type        = bool
  description = "Toggle to enable force-destruction of S3 Bucket"
  default     = false
}

variable "website" {
  type        = map(string)
  description = "Map of Website configuration of S3 Bucket"
  default     = {}
}

variable "cors_rule" {
  // NOTE: change to `map(any)` once supported
  type        = any
  description = "Map of CORS Rules of S3 Bucket"
  default     = {}
}

variable "versioning" {
  type        = map(string)
  description = "Map of Versionining configuration of S3 Bucket"
  default     = {}
}

variable "logging" {
  type        = map(string)
  description = "Map of Logging configuration of S3 Bucket"
  default     = {}
}

variable "lifecycle_rule" {
  type        = list
  description = "Map of Lifecycle Rule configuration of S3 Bucket"
  default     = []
}

variable "acceleration_status" {
  type        = string
  description = "Acceleration Status of S3 Bucket"
  default     = null
}

variable "request_payer" {
  type        = string
  description = "Identifier for Request Cost-allocation of S3 Bucket"
  default     = "BucketOwner"
}

variable "server_side_encryption_configuration" {
  type        = map
  description = "Server-side Encryption (SSE) Configuration of S3 Bucket"
  default     = {}
}

variable "object_lock_configuration" {
  // NOTE: change to `map(any)` once supported
  type        = any
  description = "Object-lock Configuration of S3 Bucket"
  default     = {}
}

variable "create_readme" {
  type        = bool
  description = "Toggle creation of `README.md` in root of S3 Bucket"
  default     = true
}

variable "readme_additions" {
  type        = string
  description = "Additional content (e.g.: information, instructions) to add to README.md"
  default     = ""
}

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
}
