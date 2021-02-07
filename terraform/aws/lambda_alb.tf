
# Create Security group for ALB
resource "aws_security_group" "SECURITY_GROUP" {
  name        = "legacy-http-https"
  vpc_id      = local.vpc_id
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

# Create Legacy ALB
resource "aws_lb" "LB_LEGACY" {
  name                       = "${local.env}-legacy"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.SECURITY_GROUP.id]
  subnets                    = local.subnets
}

# Create HTTP & HTTPS listeners for Legacy ALB
resource "aws_lb_listener" "LB_LISTENER_LEGACY_HTTP" {
  load_balancer_arn          = aws_lb.LB_LEGACY.arn
  port                       = 80
  protocol                   = "HTTP"
  default_action {
    target_group_arn         = aws_lb_target_group.LB_TG_LEGACY.arn
    type                     = "forward"
  }
}
resource "aws_lb_listener" "LB_LISTENER_HTTPS" {
  load_balancer_arn          = aws_lb.LB_LEGACY.arn
  port                       = "443"
  protocol                   = "HTTPS"
  default_action {
    type                     = "forward"
    target_group_arn         = aws_lb_target_group.LB_TG_LEGACY.arn
  }
  certificate_arn            = local.htl_cert_arn
  ssl_policy                 = local.ssl_policy_name
}

# Also add YSI SSL cert to HTTPS listener
resource "aws_lb_listener_certificate" "LB_LISTENER_CERT_YSI" {
  listener_arn               = aws_lb_listener.LB_LISTENER_HTTPS.arn
  #certificate_arn            = aws_acm_certificate.ACM_CERT_LEGACY_YSI.arn
  certificate_arn            = local.ysi_cert_arn
}
