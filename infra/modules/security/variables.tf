variable "project_name" {
    description = "The name of the project"
    type = string
}

variable "container_port" {
    description = "Port the application uses"
    type = number
}

variable "vpc_id" {
    description = "VPC id"
    type = string
}