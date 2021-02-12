variable "lambda_name" {
  type             = string
  default          = "mylambda"

}
variable "lambda_description" {
  type             = string
  default          = "Description goes here"
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
  default          = ["subnet-08b00cde0eba087a5", "subnet-05a56f3ab6fb3423e", "subnet-037eee932911f0f5e"]
}
variable "cert_arn" {
  type             = string
  default          = "arn:aws:acm:us-east-2:694058713236:certificate/2774acd1-fa08-4d92-ab21-d670dece8232"
}

variable "function_name" {
  type             = string
  default          = "lambda_function"
}

variable "handler_name" {
  type             = string
  default          = "lambda_handler"
}

variable "zipfile_name" {
  type             = string
  default          = "lambda.zip"
}

locals {
  runtime          = "python3.8"
  ssl_policy_name  = "ELBSecurityPolicy-2016-08"
}
