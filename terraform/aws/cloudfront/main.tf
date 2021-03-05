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



