provider "aws" {
  profile          = "default"
  region           = "us-east-1"
}

output instance_name { value = aws_cloudfront_distribution.CLOUDFRONT_DS.*.domain_name }

