terraform {
  backend "s3" {
    access_key = "AKIAVLQ7"
    secret_key = "L22QMqJ"
    bucket     = "terraforms3teja" #bucket name
    key        = "sree.tfstate"
    region     = "ap-south-1"
  }
}
