
# Create Lambda Function
resource "aws_lambda_function" "LAMBDA_FUNCTION" {
  filename         = local_filename
  function_name    = local.function_name
  role		   = aws_iam_role.LAMBDA_ROLE.arn
  handler          = local.handler
  runtime          = local.runtime
  memory_size      = 128
  description      = local.description
}

# Create alias for live
resource aws_lambda_alias "LAMBDA_ALIAS" {
  name             = "live"
  description      = "Live alias"
  function_name    = aws_lambda_function.LAMBDA_FUNCTION.arn
  function_version = aws_lambda_function.LAMBDA_FUNCTION.version
}

