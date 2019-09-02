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
