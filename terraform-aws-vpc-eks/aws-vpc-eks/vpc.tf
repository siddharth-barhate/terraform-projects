locals {
  vpc_flow_logs_bucket = "vpc-flow-logs-s3-${random_pet.this.id}"
}

module "vpc" {
  source                    = "terraform-aws-modules/vpc/aws"
  version                   = "5.21.0"
  name                      = var.vpc_name
  cidr                      = var.vpc_cidr
  azs                       = var.vpc_azs
  private_subnets           = var.private_subnets
  public_subnets            = var.public_subnets
  intra_subnets             = var.intra_subnets
  enable_nat_gateway        = var.enable_nat_gateway
  single_nat_gateway        = var.single_nat_gateway
  one_nat_gateway_per_az    = var.one_nat_gateway_per_az
  enable_vpn_gateway        = var.enable_vpn_gateway
  enable_flow_log           = var.enable_flow_log
  flow_log_destination_type = "s3"
  flow_log_destination_arn  = module.s3_bucket.s3_bucket_arn

  tags = var.tags
}

# S3 Bucket

resource "random_pet" "this" {
  length = 4
}

module "s3_bucket" {
  source        = "terraform-aws-modules/s3-bucket/aws"
  version       = "~> 3.0"
  bucket        = local.vpc_flow_logs_bucket
  policy        = data.aws_iam_policy_document.flow_log_s3.json
  force_destroy = true

  tags = var.tags
}

data "aws_iam_policy_document" "flow_log_s3" {
  statement {
    sid = "AWSLogDeliveryWrite"
    principals {
      type        = "Service"
      identifiers = ["delivery.logs.amazonaws.com"]
    }
    actions   = ["s3:PutObject"]
    resources = ["arn:aws:s3:::${local.vpc_flow_logs_bucket}/AWSLogs/*"]
  }

  statement {
    sid = "AWSLogDeliveryAclCheck"
    principals {
      type        = "Service"
      identifiers = ["delivery.logs.amazonaws.com"]
    }
    actions   = ["s3:GetBucketAcl"]
    resources = ["arn:aws:s3:::${local.vpc_flow_logs_bucket}"]
  }
}
