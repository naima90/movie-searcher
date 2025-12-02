# Outputs ALB DNS to access the app
output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}