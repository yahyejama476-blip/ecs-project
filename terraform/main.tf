module "vpc" {
  source = "./modules/vpc"
}

module "ecr" {
  source = "./modules/ecr"
  name   = "it-tools"
}