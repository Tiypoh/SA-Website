variable "billing_account" {
  description = "The ID of the billing account to associate projects with"
  type        = string
  default     = "018A44-73EE43-ECFB72"
}

variable "org_id" {
  description = "The organization id for the associated resources"
  type        = string
  default     = "685262316866"
}

variable "billing_project" {
  description = "The project id to use for billing"
  type        = string
  default     = "seb-auto-config"
}
