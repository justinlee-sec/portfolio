output "name_servers" {
  description = "The name servers for the Route 53 hosted zone."
  value       = aws_route53_zone.main.name_servers
}

output "bucket_name" {
  value = aws_s3_bucket.site.id
}

output "distribution_id" {
  value = aws_cloudfront_distribution.site.id
}