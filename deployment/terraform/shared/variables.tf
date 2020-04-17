variable "region" {
  type = string
  default = "us-west-1"
}

variable "environment" {
    type = string
    default = "prod"
}

variable "cidr_block" {
    type = string
    default = "10.0.0.0/16"
}

variable "subnet1_az" {
    type = string
    default = "us-west-1a"
}

variable "subnet2_az" {
    type = string
    default = "us-west-1b"
}