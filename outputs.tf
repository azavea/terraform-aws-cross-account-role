output "role_arn" {
  value = "${aws_iam_role.cross_account_assume_role.arn}"
}
