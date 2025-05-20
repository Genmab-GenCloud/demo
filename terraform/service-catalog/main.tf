terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_servicecatalog_portfolio" "main" {
  name          = "ExamplePortfolio"
  description   = "Service Catalog Portfolio"
  provider_name = "IT Department"
}

resource "aws_servicecatalog_product" "s3_bucket" {
  name        = "SimpleS3Bucket"
  owner       = "IT Department"
  description = "Provision a basic S3 bucket"
  type        = "CLOUD_FORMATION_TEMPLATE"

  provisioning_artifact_parameters {
    name         = "v1"
    type         = "CLOUD_FORMATION_TEMPLATE"
    description  = "Initial version"
    template_url = "file://${path.module}/templates/s3-bucket.yaml"
  }
}

resource "aws_servicecatalog_portfolio_product_association" "assoc" {
  portfolio_id = aws_servicecatalog_portfolio.main.id
  product_id   = aws_servicecatalog_product.s3_bucket.id
}
