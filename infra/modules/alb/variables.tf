variable "project_name" {
    description = "The name of the project"
    type = string
}

variable "container_port" {
    description = "Port the application uses"
    type = number
}

variable "alb_ssl_policy" {
  description = "SSL policy for ALB HTTPS listener"
  type = string
}

variable "vpc_id" {
  description = "The id of the VPC"
  type = string
}

variable "public_subnet_ids" {
  description = "Ids for the subnets"
  type = list(string)
}

variable "certificate_arn" {
  description = "ACM certificate arn"
  type = string
}

variable "alb_sg_id" {
  description = "ALB secuirty group id"
  type = string
}

