variable "region" {
  description = "The AWS region where resources will be created."
  type        = string
}

variable "bucket" {
  description = "The name of the S3 bucket used for storing Terraform state files."
  type        = string
}

variable "key" {
  description = "The key within the S3 bucket to store the Terraform state file."
  type        = string
}

variable "vpc_name" {
  description = "The name to assign to the VPC."
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "vpc_azs" {
  description = "List of availability zones where the subnets will be created."
  type        = list(string)
}

variable "private_subnets" {
  description = "List of CIDR blocks for the private subnets."
  type        = list(string)
}

variable "public_subnets" {
  description = "List of CIDR blocks for the public subnets."
  type        = list(string)
}

variable "intra_subnets" {
  description = "List of CIDR blocks for intra (internal-only) subnets."
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Boolean flag to enable or disable the creation of NAT gateways."
  type        = bool
}

variable "single_nat_gateway" {
  description = "If true, creates a single shared NAT gateway instead of one per AZ."
  type        = bool
}

variable "one_nat_gateway_per_az" {
  description = "If true, creates one NAT gateway in each availability zone."
  type        = bool
}

variable "enable_vpn_gateway" {
  description = "Boolean flag to enable or disable the creation of a VPN gateway."
  type        = bool
}

variable "enable_flow_log" {
  description = "Boolean flag to enable or disable VPC flow logs."
  type        = bool
}

variable "tags" {
  description = "A map of tags to apply to all resources that support tagging."
  type        = map(string)
}
