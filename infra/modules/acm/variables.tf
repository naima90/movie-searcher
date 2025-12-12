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

variable "hosted_zone_id" {
    description = "Hosted zone id from route53"
    type = string
}