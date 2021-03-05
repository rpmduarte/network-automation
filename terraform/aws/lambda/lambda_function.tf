
# Create Lambda Function
resource "aws_lambda_function" "LAMBDA_FUNCTION" {
  filename         = var.zipfile_name
  function_name    = var.function_name
  role		   = aws_iam_role.LAMBDA_ROLE.arn
  handler          = "${var.function_name}.${var.handler_name}"
  runtime          = local.runtime
  memory_size      = 128
  description      = var.lambda_description
}

# Create alias for live
resource aws_lambda_alias "LAMBDA_ALIAS" {
  name             = "live"
  description      = "Live alias"
  function_name    = aws_lambda_function.LAMBDA_FUNCTION.arn
  function_version = aws_lambda_function.LAMBDA_FUNCTION.version
}

