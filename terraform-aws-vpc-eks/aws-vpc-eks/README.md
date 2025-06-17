# 🚀 Terraform AWS VPC with Flow Logs

This Terraform module deploys an **AWS Virtual Private Cloud (VPC)** using the popular [terraform-aws-modules/vpc/aws](https://github.com/terraform-aws-modules/terraform-aws-vpc) module.

It also provisions:

- Public, private, and intra subnets across multiple availability zones
- Configurable NAT Gateway and VPN Gateway support
- VPC Flow Logs delivered to an S3 bucket
- S3 bucket with IAM policy allowing VPC flow log delivery

---

## 📦 Features

- Configurable VPC CIDR block and name
- Support for multiple AZs
- Support for public, private, and intra subnet tiers
- Optional NAT Gateway (single or per-AZ)
- Optional VPN Gateway
- VPC Flow Logs enabled and stored in an S3 bucket with secure delivery permissions
- Tags applied to all resources
- Random suffix added to the S3 bucket name for uniqueness

## 🧪 Usage Plan

Follow these steps to configure and initialize the Terraform project:

1. **Rename the Variables File**  
   Rename the template file to the actual variable file used by Terraform:

   ```bash
   mv terraform.tfvars.template terraform.tfvars
   ```
2. **Update Variable Values**  
   Open `terraform.tfvars` and update the values as needed for your environment (e.g., VPC CIDR, subnet ranges, region, tags, etc.).

3. **Initialize Terraform Backend**  
    Initialize the backend using the configuration from `terraform.tfvars`
   ```bash
   terraform init -backend-config=terraform.tfvars
   ```
⚠️ Note: You only need to modify terraform.tfvars.
Use the S3 bucket that was generated previously in the aws-remote-state directory for backend configuration.

4. **Create resources:**  
   ```bash
   terraform apply
   ```



<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3_bucket"></a> [s3\_bucket](#module\_s3\_bucket) | terraform-aws-modules/s3-bucket/aws | ~> 3.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 5.21.0 |

## Resources

| Name | Type |
|------|------|
| [random_pet.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |
| [aws_iam_policy_document.flow_log_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket"></a> [bucket](#input\_bucket) | The name of the S3 bucket used for storing Terraform state files. | `string` | n/a | yes |
| <a name="input_enable_flow_log"></a> [enable\_flow\_log](#input\_enable\_flow\_log) | Boolean flag to enable or disable VPC flow logs. | `bool` | n/a | yes |
| <a name="input_enable_nat_gateway"></a> [enable\_nat\_gateway](#input\_enable\_nat\_gateway) | Boolean flag to enable or disable the creation of NAT gateways. | `bool` | n/a | yes |
| <a name="input_enable_vpn_gateway"></a> [enable\_vpn\_gateway](#input\_enable\_vpn\_gateway) | Boolean flag to enable or disable the creation of a VPN gateway. | `bool` | n/a | yes |
| <a name="input_intra_subnets"></a> [intra\_subnets](#input\_intra\_subnets) | List of CIDR blocks for intra (internal-only) subnets. | `list(string)` | n/a | yes |
| <a name="input_key"></a> [key](#input\_key) | The key within the S3 bucket to store the Terraform state file. | `string` | n/a | yes |
| <a name="input_one_nat_gateway_per_az"></a> [one\_nat\_gateway\_per\_az](#input\_one\_nat\_gateway\_per\_az) | If true, creates one NAT gateway in each availability zone. | `bool` | n/a | yes |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | List of CIDR blocks for the private subnets. | `list(string)` | n/a | yes |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | List of CIDR blocks for the public subnets. | `list(string)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region where resources will be created. | `string` | n/a | yes |
| <a name="input_single_nat_gateway"></a> [single\_nat\_gateway](#input\_single\_nat\_gateway) | If true, creates a single shared NAT gateway instead of one per AZ. | `bool` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to apply to all resources that support tagging. | `map(string)` | n/a | yes |
| <a name="input_vpc_azs"></a> [vpc\_azs](#input\_vpc\_azs) | List of availability zones where the subnets will be created. | `list(string)` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | The CIDR block for the VPC. | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | The name to assign to the VPC. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_igw_id"></a> [igw\_id](#output\_igw\_id) | The ID of the Internet Gateway |
| <a name="output_intra_subnets"></a> [intra\_subnets](#output\_intra\_subnets) | List of IDs of intra subnets |
| <a name="output_natgw_ids"></a> [natgw\_ids](#output\_natgw\_ids) | List of NAT Gateway IDs |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | List of IDs of private subnets |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | List of IDs of public subnets |
| <a name="output_vpc_arn"></a> [vpc\_arn](#output\_vpc\_arn) | The ARN of the VPC |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | The CIDR block of the VPC |
| <a name="output_vpc_flow_log_id"></a> [vpc\_flow\_log\_id](#output\_vpc\_flow\_log\_id) | The ID of the Flow Log resource |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
