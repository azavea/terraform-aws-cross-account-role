variable "name" {
  type        = "string"
  description = "Name of the role being created."
}

variable "principal_arns" {
  type        = "list"
  description = "ARNs of accounts, groups, or users with the ability to assume this role."
}

variable "policy_arns" {
  type        = "list"
  description = "List of ARNs of policies to be associated with the created IAM role"
}
