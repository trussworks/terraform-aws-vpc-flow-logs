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
## Inputs
## Outputs
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
