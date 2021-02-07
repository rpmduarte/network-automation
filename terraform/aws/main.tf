provider "aws" {
  profile          = "default"
  region           = "us-east-1"
}

module "lambda" {
  source              = "./lambda"
  region_names        = var.region_names
}

module "cloudfront" {
  source              = "./cloudfront"
  region_names        = var.region_names
}


output instance_name { value = aws_cloudfront_distribution.CLOUDFRONT_DS.*.domain_name }

