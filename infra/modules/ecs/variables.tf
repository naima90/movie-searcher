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

variable "ecr_image" {
    description = "image the application uses"
    type = string
} 

variable "private_subnet_ids" {
    description = "Ids for the private subnets"
    type = list(string)
}

variable "alb_target_group" {
    description = "Target group for ALB"
    type = string
}

variable "ecs_sg_id" {
    description = "ECS security group id"
    type = string
}

