# AWS Service Catalog Terraform Example

This Terraform configuration provisions an AWS Service Catalog portfolio and
product that deploys a simple S3 bucket using a CloudFormation template.

## Usage

1. Adjust the `region` variable in `variables.tf` if necessary.
2. Run `terraform init` and `terraform apply` in this directory.

The output values include the portfolio and product IDs created.
