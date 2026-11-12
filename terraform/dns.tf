resource "aws_acm_certificate" "tm" {
  domain_name       = "tm.labs.yahyejama.win"
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_dns_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.tm.domain_validation_options : dvo.domain_name => {
      name    = trimsuffix(dvo.resource_record_name, ".")
      type    = dvo.resource_record_type
      content = trimsuffix(dvo.resource_record_value, ".")
    }
  }

  zone_id = var.cloudflare_zone_id
  name    = each.value.name
  type    = each.value.type
  content = each.value.content
  ttl     = 60
  proxied = false
}

resource "aws_acm_certificate_validation" "tm" {
  certificate_arn         = aws_acm_certificate.tm.arn
  validation_record_fqdns = [for r in cloudflare_dns_record.cert_validation : r.name]
}

resource "cloudflare_dns_record" "tm" {
  zone_id = var.cloudflare_zone_id
  name    = "tm.labs"
  type    = "CNAME"
  content = module.alb.dns_name
  ttl     = 300
  proxied = false
}