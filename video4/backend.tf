terraform {
  backend "s3" {
    access_key = "AKIAVQRCLW4SZ2EDILQ7"
    secret_key = "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"
    bucket     = "terraforms3teja" #bucket name
    key        = "sree.tfstate"
    region     = "ap-south-1"
  }
}