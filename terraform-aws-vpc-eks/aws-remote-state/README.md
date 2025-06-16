# Terraform Backend S3 Bucket with KMS Encryption

This Terraform configuration creates an **S3 bucket** with **KMS encryption** to be used as a **remote backend for Terraform state**. It is pre-configured for best practices such as versioning and public access blocking.

## 📦 What This Module Does

- Creates a secure **S3 bucket** with:
  - **Server-side encryption** using a custom **AWS KMS key**
  - **Bucket versioning** enabled
  - **Public access** fully blocked

- Outputs:
  - The **KMS key ARN**
  - The **S3 bucket name**

## 🚀 Usage Instructions

1. Clone this directory or add it to your Terraform project.
2. Initialize Terraform:

   ```bash
   terraform init
   ```

3. Create resources:

   ```bash
   terraform apply
   ```

## 🔧 Customization

You can customize the Terraform backend resources by modifying the `local` block in `main.tf`.

### 🔄 Parameters to Customize

- **`region`**: Set your preferred AWS region.
- **`bucket_name`**: Provide a unique name for your S3 bucket.
- **`tags`**: Add key-value pairs to tag your AWS resources for cost tracking, organization, or policy enforcement.

### 📝 Example

Edit the `locals` block in `main.tf`:

```hcl
locals {
  region      = "us-west-2"
  bucket_name = "my-custom-terraform-backend"
  tags = {
    terraform_managed = "true"
    Department        = "Engineering"
    Team              = "DevOps"
  }
}
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

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_kms_key.s3_encryption_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_bucket.terraform_backend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.terraform_backend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.terraform_backend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.terraform_backend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_KMS_Key_ARN"></a> [KMS\_Key\_ARN](#output\_KMS\_Key\_ARN) | n/a |
| <a name="output_S3_Bucket_name"></a> [S3\_Bucket\_name](#output\_S3\_Bucket\_name) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
