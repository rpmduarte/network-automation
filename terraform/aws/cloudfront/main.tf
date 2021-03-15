#terraform {
#  backend "s3" {
#    bucket = "j5-org"
#    key    = "terraform/state"
#    region = "us-east-2"
#  }
#}


provider "aws" {
  profile          = "default"
  region           = "us-east-2"
}

output cloudfront_dns_name { value = aws_cloudfront_distribution.CLOUDFRONT_DS.*.domain_name }
output cloudfront_http_version { value = aws_cloudfront_distribution.CLOUDFRONT_DS.*.http_version }
