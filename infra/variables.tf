variable "aws_region" { 
  type = string
  default = "eu-west-2"
  }
variable "project_name" { 
  type = string
  default = "movie-searcher-app"
  }
variable "domain_name" { 
  type = string
  default = "naimaosmann.com"
  }
variable "subdomain" { 
  type = string
  default = "tm"
  }
variable "alb_ssl_policy" { 
  type = string
  default = "ELBSecurityPolicy-2016-08" 
  }
variable "container_port" {
  type    = number
  default = 8080
}
