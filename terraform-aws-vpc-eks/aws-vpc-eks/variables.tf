variable "region" {
  description = "The AWS region where resources will be created."
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

variable "cluster_name" {
  description = "Name of the EKS cluster."
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster (e.g., '1.29')."
  type        = string
}

variable "cluster_endpoint_public_access" {
  description = "Whether the EKS cluster control plane endpoint is publicly accessible."
  type        = bool
}

variable "enable_cluster_creator_admin_permissions" {
  description = "Whether to grant full administrative permissions to the cluster creator."
  type        = bool
}

variable "managed_node_group_name" {
  description = "Name of the managed node group within the EKS cluster."
  type        = string
}

variable "ami_type" {
  description = "AMI type to use for the managed node group (e.g., 'AL2_x86_64', 'BOTTLEROCKET_x86_64')."
  type        = string
  # See: https://docs.aws.amazon.com/eks/latest/APIReference/API_Nodegroup.html#AmazonEKS-Type-Nodegroup-amiType
}

variable "instance_types" {
  description = "List of EC2 instance types to use for the managed node group."
  type        = list(string)
}

variable "managed_ng_min_size" {
  description = "Minimum number of nodes in the managed node group."
  type        = number
}

variable "managed_ng_max_size" {
  description = "Maximum number of nodes in the managed node group."
  type        = number
}

variable "managed_ng_desired_size" {
  description = "Desired number of nodes in the managed node group."
  type        = number
}

variable "create_managed_node_group" {
  description = "Whether to create a managed node group as part of the EKS cluster."
  type        = bool
}
