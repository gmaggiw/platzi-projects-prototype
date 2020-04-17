terraform {
  backend "s3" {
    bucket = "gmaggi-terraform-states"
    key    = "platziprojects/shared/shared.tfstate"
    region = "us-east-1"
  }
}
