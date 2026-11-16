output "name_servers" {
  description = "The name servers for the Route 53 hosted zone."
  value       = aws_route53_zone.main.name_servers
}