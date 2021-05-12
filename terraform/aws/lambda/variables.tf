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
  default          = "us-east-1"
}
variable "vpc_id" {
  type             = string
}
variable "subnet_ids" {
  type             = list(string)
}
variable "cert_arn" {
  type             = string
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

variable "runtime" {
  type             = string
  default          = "nodejs14.x"
}

variable "memsize" {
  type             = number
  default          = 128
}


variable "ssl_policy_name" {
  type             = string
  default          = "ELBSecurityPolicy-2016-08"
}
