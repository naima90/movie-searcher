variable "aws_region" {
    type = string
    default = "eu-west-2"
}

variable "project_name" {
    type = string
    default = "movie-searcher-app"
}

variable "container_port" {
    type = number
    default = 8080
}
