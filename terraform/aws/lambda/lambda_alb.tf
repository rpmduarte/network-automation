
# Create Security group for ALB
resource "aws_security_group" "ALB_SECURITY_GROUP" {
  name        = "allow-http-https"
  vpc_id      = var.vpc_id
  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    protocol    = "icmp"
    from_port   = -1
    to_port     = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create Target Group
resource "aws_lb_target_group" "LAMBDA_TG" {
  name                               = "${var.lambda_name}-tg"
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
  source_arn       = aws_lb_target_group.LAMBDA_TG.arn
}

# Attach Lambda Function to Target Group
resource "aws_lb_target_group_attachment" "TG_ATTACHMENT" {
  target_group_arn = aws_lb_target_group.LAMBDA_TG.arn
  #target_id        = aws_lambda_function.LAMBDA_FUNCTION.arn
  target_id        = aws_lambda_alias.LAMBDA_ALIAS.arn
  depends_on       = [ aws_lambda_permission.LAMBDA_PERMISSION, aws_lambda_alias.LAMBDA_ALIAS ]
}

# Create ALB
resource "aws_lb" "LAMBDA_ALB" {
  name                       = "${var.lambda_name}-alb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.ALB_SECURITY_GROUP.id]
  subnets                    = local.subnets
}

# Create HTTP & HTTPS listeners for ALB
resource "aws_lb_listener" "ALB_LISTENER_HTTP" {
  load_balancer_arn          = aws_lb.LAMBDA_ALB.arn
  port                       = 80
  protocol                   = "HTTP"
  # Redirect 80 -> 443
  default_action {
    target_group_arn         = aws_lb_target_group.LB_TG_LEGACY.arn
    type                     = "forward"
  }
}
resource "aws_lb_listener" "ALB_LISTENER_HTTPS" {
  load_balancer_arn          = aws_lb.LAMBDA_ALB.arn
  port                       = "443"
  protocol                   = "HTTPS"
  default_action {
    type                     = "forward"
    target_group_arn         = aws_lb_target_group.LAMBDA_TG.arn
  }
  certificate_arn            = var.cert_arn
  ssl_policy                 = local.ssl_policy_name
}

# Attach additional certs, if given
resource "aws_lb_listener_certificate" "ALB_LISTENER_CERT" {
  listener_arn               = aws_lb_listener.LB_LISTENER_HTTPS.arn
  #certificate_arn            = aws_acm_certificate.ACM_CERT_LEGACY_YSI.arn
  certificate_arn            = var.cert_arn
}
