resource "aws_ecr_repository" "app" {
  name                 = var.project_name
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  tags = {
    Name = "${var.project_name}-ecr"
  }
}

module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name
}

module "alb" {
  source = "./modules/alb"

  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  certificate_arn   = module.acm.certificate_arn
  alb_sg_id         = module.security.alb_sg_id

  project_name   = var.project_name
  container_port = var.container_port
  alb_ssl_policy = var.alb_ssl_policy
}

module "security" {
  source = "./modules/security"

  vpc_id = module.vpc.vpc_id

  project_name   = var.project_name
  container_port = var.container_port
}

module "ecs" {
  source = "./modules/ecs"

  ecr_image          = aws_ecr_repository.app.repository_url
  private_subnet_ids = module.vpc.private_subnet_ids
  alb_target_group   = module.alb.alb_target_group
  ecs_sg_id          = module.security.ecs_sg_id

  aws_region     = var.aws_region
  project_name   = var.project_name
  container_port = var.container_port

}

module "route53" {
  source = "./modules/route53"

  alb_zone_id  = module.alb.alb_zone_id
  alb_dns_name = module.alb.alb_dns_name


  project_name = var.project_name
  domain_name  = var.domain_name
  subdomain    = var.subdomain
}

module "acm" {
  source = "./modules/acm"

  hosted_zone_id = module.route53.hosted_zone_id

  project_name = var.project_name
  domain_name  = var.domain_name
  subdomain    = var.subdomain
}








