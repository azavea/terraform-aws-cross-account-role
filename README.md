# terraform-aws-cross-account-role
A Terraform module to create an IAM role for cross-account use. This module creates the role in the satellite account, but does not configure access in the source account.

# Usage
```hcl
# Account 111111111111 configuration

# Creates arn:aws:iam::111111111111:role/CrossAccountDeveloper
module "cross_account_role" {
  source                      = "github.com/azavea/terraform-aws-cross-account-role?ref=0.1.0"
  name                        = "CrossAccountDeveloper"
  principal_arns              = ["222222222222","arn:aws:iam::333333333333:user/MyUser"]
  policy_arns                 = ["arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser", "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"]
}
```

```hcl
# Account 333333333333 configuration

data "aws_iam_policy_document" "cross_account_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::333333333333:user/MyUser"]
    }

    resource = ["arn:aws:iam::111111111111:role/CrossAccountDeveloper"]

    actions = ["sts:AssumeRole"]
  }
}
```


# Variables

- `name` - Name of the IAM Role you'd like to create.
- `principal_arns` - List of ARNs for the AWS accounts, groups, users, or roles that should be able to access this role.
- `policy_arns` - List of ARNs of IAM policies to attach to the IAM role.

# Outputs

- `role_arn` - ARN of the IAM role.
