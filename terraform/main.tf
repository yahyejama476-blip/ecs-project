module "vpc" {
  source = "./modules/vpc"
}

module "ecr" {
  source = "./modules/ecr"
  name   = "it-tools"
}

data "aws_acm_certificate" "tm" {
  domain      = "tm.labs.yahyejama.win"
  statuses    = ["ISSUED"]
  most_recent = true
}

module "alb" {
  source = "./modules/alb"

  name              = "it-tools"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  certificate_arn   = data.aws_acm_certificate.tm.arn
}

module "ecs" {
  source = "./modules/ecs"

  name                  = "it-tools"
  region                = "eu-west-2"
  vpc_id                = module.vpc.vpc_id
  subnet_ids            = module.vpc.public_subnet_ids
  alb_security_group_id = module.alb.security_group_id
  target_group_arn      = module.alb.target_group_arn
  container_image       = "${module.ecr.repository_url}:${var.image_tag}"

  depends_on = [module.alb]
}