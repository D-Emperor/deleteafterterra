resource "aws_internet_gateway" "tf_igw" {
  vpc_id = aws_vpc.TF_VPC.id
  tags = {
    Name = "$(var.vpc_name)-igw"
  }
}