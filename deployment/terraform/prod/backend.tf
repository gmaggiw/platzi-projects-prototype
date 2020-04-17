terraform {
  backend "s3" {
    bucket = "gmaggi-terraform-states"
    key    = "platziprojects/prod/prod.tfstate"
    region = "us-east-1"
  }
}