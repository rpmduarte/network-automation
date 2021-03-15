resource "aws_cloudfront_origin_access_identity" "OAI" {
  comment = "OAI policy for ${var.short_name}"
}

resource "aws_cloudfront_distribution" "CLOUDFRONT_DS" {

  origin {
    domain_name              = "${var.s3_bucket_name}.s3.amazonaws.com"
    origin_id                = "S3-${var.s3_bucket_name}"
    origin_path              = var.s3_site_path
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.OAI.cloudfront_access_identity_path
    }
  }

  enabled                    = true
  is_ipv6_enabled            = false
  price_class                = var.price_class
  aliases                    = var.site_hostnames
  default_root_object        = var.root_page
  custom_error_response      {
    error_code               = 404
    response_code            = 404
    response_page_path       = "/404.html"
    error_caching_min_ttl    = 60
  }
  viewer_certificate {
    #acm_certificate_arn      = aws_acm_certificate.ACM_CERT_WWW.arn
    acm_certificate_arn      = var.cert_arn
    minimum_protocol_version = local.security_policy
    ssl_support_method       = "sni-only"
  }

  restrictions {
    geo_restriction {
      restriction_type       = "blacklist"
      locations              = local.country_blacklist
    }
  }

  default_cache_behavior {
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "S3-${var.s3_bucket_name}"
    forwarded_values {
      headers              = ["Origin"]
      query_string         = true
      cookies {
        forward            = "all"
      }
    }
    viewer_protocol_policy = "allow-all"
    min_ttl                = local.min_ttl
    default_ttl            = local.default_ttl
    max_ttl                = local.max_ttl
  }
}

