provider "aws" {
  region                      = var.region
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  s3_force_path_style         = true
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"

}

locals {
  application_name       = "gmaggi-platziprojects-${var.environment}"
  application_name_lower = replace(lower(local.application_name), "/[^a-z0-9]/", "")
}

module "vpc" {
    source = "../modules/vpc"

    cidr_block = var.cidr_block
    subnet1_az = var.subnet1_az
    subnet2_az = var.subnet2_az
}


module "ecs-deployline" {
  source  = "../modules/ecs-deploy-pipeline"
  region  = var.region

  # 2. Your vpc and subnets id.
  vpc_id         = module.vpc.vpc_id
  public_subnets = [module.vpc.subnet1_id, module.vpc.subnet2_id]

  cluster_name        = local.application_name
  app_repository_name = local.application_name
  container_name      = local.application_name

  # 3. Port to use
  alb_port         = "80"
  container_port   = "8000"
  helth_check_path = "/"

  # 4. Your github repository.
  git_repository = {
    owner  = "gmaggiw"
    name   = "platzi-projects-prototype"
    branch = "master"
  }
}
