resource "aws_route53_zone" "golly_life" {
  name = "golly.life"
}

resource "aws_route53_zone" "golly456_life" {
  name = "golly456.life"
}

output "golly_life_zone_id" {
  description = "Route 53 hosted zone ID for golly.life"
  value       = aws_route53_zone.golly_life.zone_id
}

output "golly_life_name_servers" {
  description = "Route 53 name servers for golly.life — update NameCheap to these"
  value       = aws_route53_zone.golly_life.name_servers
}

output "golly456_life_zone_id" {
  description = "Route 53 hosted zone ID for golly456.life"
  value       = aws_route53_zone.golly456_life.zone_id
}

output "golly456_life_name_servers" {
  description = "Route 53 name servers for golly456.life — update NameCheap to these"
  value       = aws_route53_zone.golly456_life.name_servers
}
