provider "aws" {
  profile          = "default"
  region           = "us-east-2"
}

module "lambda" {
  source              = "./lambda"
}

module "cloudfront" {
  source              = "./cloudfront"
}


output instance_name { value = aws_cloudfront_distribution.CLOUDFRONT_DS.*.domain_name }

