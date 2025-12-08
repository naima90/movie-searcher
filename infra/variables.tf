variable "aws_region" {
    description = "AWS Region"
    type = string
}

variable "project_name" {
    description = "The name of the project"
    type = string
}

variable "container_port" {
    description = "Port the application uses"
    type = number
}

variable "domain_name" {
    description = "root domain name e.g. naima.com"
    type = string
}

variable "subdomain" {
    description = "sub-domain for the app e.g. tm"
    type = string
}