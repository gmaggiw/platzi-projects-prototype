terraform {
  backend "s3" {
    bucket = "gmaggi-terraform-states"
    key    = "platziprojects/${var.environment}/${var.environment}.tfstate"
    region = "us-west-1"
  }
}
