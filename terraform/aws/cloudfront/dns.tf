# Add CNAME to CloudFront
resource "aws_route53_record" "DNS_CLOUDFRONT" {
  zone_id         = var.dns_zone_id
  name            = var.short_name
  type            = "CNAME"
  records         = [ aws_cloudfront_distribution.CLOUDFRONT_DS.domain_name ]
  ttl             = local.dns_ttl
}
