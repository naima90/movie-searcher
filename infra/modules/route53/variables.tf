variable "project_name" {
    description = "The name of the project"
    type = string
}

variable "domain_name" {
    description = "root domain name e.g. naima.com"
    type = string
}

variable "subdomain" {
    description = "sub-domain for the app e.g. tm"
    type = string
}

variable "alb_zone_id" {
  description = "Route53 hosted zone ID for DNS validation"
  type        = string
}

variable "alb_dns_name" {
    description = "The ALB dns name"
    type = string
}