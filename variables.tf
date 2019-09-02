variable "name" {
  type        = string
  description = "TODO"
}

variable "use_prefix" {
  type        = bool
  description = "TODO"
  default     = false
}

variable "acl" {
  type        = string
  description = "TODO"
  default     = "private"
}

variable "policy" {
  type        = string
  description = "TODO"
  default     = null
}

variable "use_default_tags" {
  type        = bool
  description = "TODO"
  default     = true
}

variable "tags" {
  type        = map
  description = "TODO"
  default     = {}
}

variable "force_destroy" {
  type        = bool
  description = "TODO"
  default     = false
}

variable "website" {
  type        = map(string)
  description = "TODO"
  default     = {}
}

variable "cors_rule" {
  // NOTE: change to `map(any)` once supported
  type        = any
  description = "TODO"
  default     = {}
}

variable "versioning" {
  type        = map(string)
  description = "TODO"
  default     = {}
}

variable "logging" {
  type        = map(string)
  description = "TODO"
  default     = {}
}

variable "lifecycle_rule" {
  type        = "list"
  description = "TODO"
  default     = []
}

variable "acceleration_status" {
  type        = string
  description = "TODO"
  default     = "Suspended"
}

variable "request_payer" {
  type        = string
  description = "TODO"
  default     = "BucketOwner"
}

variable "region" {
  type        = string
  description = "TODO"
  default     = null
}

variable "server_side_encryption_configuration" {
  type        = map
  description = "TODO"
  default     = {}
}

variable "object_lock_configuration" {
  // NOTE: change to `map(any)` once supported
  type        = any
  description = "TODO"
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
