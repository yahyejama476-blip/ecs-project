terraform {
  backend "s3" {
    bucket       = "yahyejama-tfstate-3939"
    key          = "ecs-project/terraform.tfstate"
    region       = "eu-west-2"
    encrypt      = true
    use_lockfile = true
  }
}