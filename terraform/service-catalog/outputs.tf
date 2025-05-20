output "portfolio_id" {
  value = aws_servicecatalog_portfolio.main.id
}

output "product_id" {
  value = aws_servicecatalog_product.s3_bucket.id
}
