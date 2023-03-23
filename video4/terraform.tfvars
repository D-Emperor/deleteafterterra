cidr_block          = "10.0.0.0/16"
vpc_name            = "TF-VPC"
aws_region          = "ap-south-1"
region              = "ap-south-2"
public_subnet_cidr  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidr = ["10.0.4.0/24", "10.0.5.0/24"]
#azs = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
image_name    = "ami-0e742cca61fb65051"
key_name      = "Mumbai"
instance_type = "t2.micro"

amis = {
  "ap-south-2" = "ami-0155ae3341da656ae"
  "ap-south-1" = "ami-0e742cca61fb65051"
}

azs = {
  "ap-south-2" = ["ap-south-2a", "ap-south-2b", "ap-south-2b"]
  "ap-south-1" = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}