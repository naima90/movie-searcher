variable "aws_region" { type = string }
variable "project_name" { type = string }
variable "domain_name" { type = string }
variable "subdomain" { type = string }
variable "alb_ssl_policy" { type = string }
variable "container_port" {
  type    = number
  default = 8080
}