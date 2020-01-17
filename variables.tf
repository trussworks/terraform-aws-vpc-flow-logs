variable "vpc_id" {
  description = "VPC ID to attach to."
  type        = string
}

variable "vpc_name" {
  description = "The VPC name is used to name the flow log resources."
  type        = string
}

variable "logs_retention" {
  description = "Number of days you want to retain log events in the log group."
  default     = 90
}
