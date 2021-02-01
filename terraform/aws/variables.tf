
variable "price_class" {
  type             = string
  default          = "PriceClass_100"
}

variable "short_name" {
  type             = string
  description      = "Short name of the CloudFront distibution" 
}
variable "site_hostnames" {
  type             = list(string)
  description      = "FQDN hostname of this website" 
}
variable "cert_arn" {
  type             = string
  description      = "ARN of SSL certificate" 
}
variable "s3_bucket_name" {
  type             = string
  description      = "S3 bucket name"
}
variable "s3_site_path" {
  type             = string
  description      = "Path inside bucket for website" 
}

locals {
  min_ttl                = 60
  default_ttl            = 1440
  max_ttl                = 86400
  country_blacklist      = [ "IR", "KP" ]
  security_policy        = "TLSv1.2_2019"
}
