Configures VPC flow logs for the given VPC.

Creates the following resources:

* CloudWatch log group.
* IAM role.
* VPC Flow Log.

## Usage

```hcl
module "vpc_flow_logs" {
  source = "trussworks/vpc-flow-logs/aws"

  vpc_name       = local.vpc_name
  vpc_id         = module.vpc.vpc_id
  logs_retention = local.cloudwatch_logs_retention
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12.0 |
| aws | ~> 2.70 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.70 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| logs\_retention | Number of days you want to retain log events in the log group. | `number` | `90` | no |
| vpc\_id | VPC ID to attach to. | `string` | n/a | yes |
| vpc\_name | The VPC name is used to name the flow log resources. | `string` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
