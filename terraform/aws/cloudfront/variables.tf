

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
  description      = "Path in bucket for website root" 
}
variable "price_class" {
  type             = string
  default          = "PriceClass_100"
}
variable "ttls" {
  type             = list(number)
  default          = [60,7200,14400]
}
variable "dns_zone_id" {
  type             = string
}

locals {
  min_ttl                = var.ttls[0]
  default_ttl            = var.ttls[1]
  max_ttl                = var.ttls[2]
  country_blacklist      = [ "IR", "KP" ]
  security_policy        = "TLSv1.2_2019"
  dns_ttl                = 300
}
