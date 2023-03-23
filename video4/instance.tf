# Here we are creating 1 public instance in each 3 public subnets

resource "aws_instance" "public_instance" {
  count = length(var.public_subnet_cidr)
  # lookup & map
  ami           = lookup(var.amis, var.aws_region)
  instance_type = "t2.micro"
  key_name      = var.key_name
  # we provide subnet because the VPC will be selected based on subnet choosen  
  subnet_id = element(aws_subnet.public-subnets.*.id, count.index)
  # here we are using [ ] because, we can have multiple sg's & even if we have 1 we have to use []
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "${var.vpc_name}-public-${count.index + 1}"
    Env        = "Prod"
    Owner      = "Sree"
    CostCenter = "ABCD"
  }
  # To copy the script file  
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("Mumbai.pem")
      host        = element(aws_instance.public_instance.*.public_ip, count.index)
    }
  }
  # To execute the script file  
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("Mumbai.pem")
      host        = element(aws_instance.public_instance.*.public_ip, count.index)
    }
  }
}

# # User data spacing is at par with Name=
#     user_data = <<-EOF
#     #!/bin/bash
#     sudo yum update -y
#     sudo yum install git -y
#     sudo yum install httpd -y
#     sudo systemctl start httpd
#     git clone https://github.com/Akiranred/ecomm.git /var/www/html/
#     sudo systemctl enable httpd
#     sudo systemctl restart httpd
#   EOF 
# }

# Here we are creating 1 private instance in each 3 private subnets

resource "aws_instance" "private_instance" {
  count = length(var.private_subnet_cidr)
  # lookup & map  
  ami           = lookup(var.amis, var.aws_region)
  instance_type = var.instance_type
  key_name      = var.key_name
  # we provide subnet because the VPC will be selected based on subnet choosen  
  subnet_id = element(aws_subnet.private-subnets.*.id, count.index)
  # here we are using [ ] because, we can have multiple sg's & even if we have 1 we have to use []
  vpc_security_group_ids = ["${aws_security_group.only_ssh.id}"]
  #  associate_public_ip_address = true	
  tags = {
    Name       = "${var.vpc_name}-private-${count.index + 1}"
    Env        = "Prod"
    Owner      = "Sree"
    CostCenter = "ABCD"
  }
  # User data spacing is at par with Name=  
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install git -y
    sudo yum install httpd -y
    sudo systemctl start httpd
    git clone https://github.com/Akiranred/ecomm.git /var/www/html/
    sudo systemctl enable httpd
    sudo systemctl restart httpd
  EOF 
}