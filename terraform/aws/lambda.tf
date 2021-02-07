
# Create Lambda Role
resource "aws_iam_role" "LAMBDA_ROLE" {
  name               = "iam_for_lambda"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17", 
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": { "Service": "lambda.amazonaws.com" },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# Create Lambda Function
resource "aws_lambda_function" "LAMBDA_FUNCTION" {
  filename         = "hightail_legacy.zip"
  function_name    = "hightail_legacy"
  role		   = aws_iam_role.LAMBDA_ROLE.arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.8"
  memory_size      = 128
  description      = "Hightail 1.0 / YSI Legacy URL redirects"
}
resource aws_lambda_alias "LAMBDA_ALIAS" {
  name             = "live"
  description      = "Live alias"
  function_name    = aws_lambda_function.LAMBDA_FUNCTION.arn
  function_version = aws_lambda_function.LAMBDA_FUNCTION.version
}

# Create Target Group
resource "aws_lb_target_group" "LB_TG_LEGACY" {
  name                               = "${local.env}-legacy"
  target_type                        = "lambda"
  lambda_multi_value_headers_enabled = false
}

# Create Permissions
resource aws_lambda_permission "LAMBDA_PERMISSION" {
  statement_id     = "AllowExecutionFromALB"
  action           = "lambda:InvokeFunction"
  function_name    = aws_lambda_function.LAMBDA_FUNCTION.function_name
  principal        = "elasticloadbalancing.amazonaws.com"
  qualifier        = aws_lambda_alias.LAMBDA_ALIAS.name
  source_arn       = aws_lb_target_group.LB_TG_LEGACY.arn
}

# Attach Lambda Function to Target Group
resource "aws_lb_target_group_attachment" "TG_ATTACHMENT" {
  target_group_arn = aws_lb_target_group.LB_TG_LEGACY.arn
  #target_id        = aws_lambda_function.LAMBDA_FUNCTION.arn
  target_id        = aws_lambda_alias.LAMBDA_ALIAS.arn
  depends_on       = [ aws_lambda_permission.LAMBDA_PERMISSION, aws_lambda_alias.LAMBDA_ALIAS ]
}
