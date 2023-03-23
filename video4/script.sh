#!/bin/bash
sudo yum update -y 
sudo yum install git -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
git clone https://github.com/D-Emperor/ecomm.git /var/www/html/
sudo systemctl restart httpd