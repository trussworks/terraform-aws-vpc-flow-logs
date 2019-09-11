/**
 * Configures VPC flow logs for the given VPC.
 *
 * Creates the following resources:
 *
 * * CloudWatch log group.
 * * IAM role.
 * * VPC Flow Log.
 *
 * ## Usage
 *
 * ```hcl
 * module "vpc_flow_logs" {
 *   source = "trussworks/vpc-flow-logs/aws"
 *
 *   vpc_name       = local.vpc_name
 *   vpc_id         = module.vpc.vpc_id
 *   logs_retention = local.cloudwatch_logs_retention
 * }
 * ```
 */

resource "aws_flow_log" "main" {
  log_destination = aws_cloudwatch_log_group.main.arn
  iam_role_arn    = aws_iam_role.main.arn
  vpc_id          = var.vpc_id
  traffic_type    = "ALL"
}

#
# CloudWatch
#

resource "aws_cloudwatch_log_group" "main" {
  name              = "vpc-flow-logs-${var.vpc_name}"
  retention_in_days = var.logs_retention
}

#
# IAM
#

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "role_policy" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
    ]

    resources = ["*"]
  }
}

resource "aws_iam_role" "main" {
  name               = "vpc-flow-logs-role-${var.vpc_name}"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

resource "aws_iam_role_policy" "main" {
  name   = "vpc-flow-logs-role-policy-${var.vpc_name}"
  role   = aws_iam_role.main.id
  policy = data.aws_iam_policy_document.role_policy.json
}
