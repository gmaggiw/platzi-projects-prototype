provider "aws" {
  region                      = var.region
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  s3_force_path_style         = true
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"

}

module "vpc" {
    source = "../modules/vpc"

    cidr_block = var.cidr_block
    subnet1_az = var.subnet1_az
    subnet2_az = var.subnet2_az
}

module "codebuild" {
    source  = "../modules/codebuild"

    environment = var.environment
    vpc_id      = module.vpc.vpc_id
    subnet1_id  = module.vpc.subnet1_id
    subnet2_id  = module.vpc.subnet2_id
    sg1_id      = module.vpc.sg1_id
    sg2_id      = module.vpc.sg2_id
    
}

module "codepipeline" {
    source  = "../modules/codepipeline"

    environment = var.environment
}