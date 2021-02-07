variable "lambda_name" {
  type             = string
  default          = "mylambda"
}
variable "region" {
  type             = string
  default          = "us-east-2"
}
variable "vpc_id" {
  type             = string
  default          = "vpc-0631ea7b73afc49f7"
}
variable "subnet_ids" {
  type             = list(string)
  default          = ["x", "y"]
}
variable "cert_arn" {
  type             = string
  default          = "asdfkjasdflkjsd"
}

locals {
  filename         = "filename.zip"
  function_name    = "lambda_function"
  handler          = "lambda_handler"
  runtime          = "python3.8"
  description      = "Description"
  ssl_policy_name  = "TLSv1.2_2019"
}
