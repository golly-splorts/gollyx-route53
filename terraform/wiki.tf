resource "aws_route53_record" "golly_life_wiki_a" {
  zone_id = local.golly_life_zone_id
  name    = "wiki.golly.life"
  type    = "A"
  ttl     = 1799
  records = ["173.255.252.181"]
}

resource "aws_route53_record" "golly_life_wiki_aaaa" {
  zone_id = local.golly_life_zone_id
  name    = "wiki.golly.life"
  type    = "AAAA"
  ttl     = 1799
  records = ["2600:3c01::f03c:92ff:fe78:f802"]
}
