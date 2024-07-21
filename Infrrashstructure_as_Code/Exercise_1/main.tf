# TODO: Designate a cloud provider, region, and credentials
# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Use an existing VPC
data "aws_vpc" "existing_vpc" {
  id = "vpc-0ced4d0b72b5b6f5e"
}

# Use an existing public subnet
data "aws_subnet" "existing_subnet" {
  id = "subnet-063f0fab51c0c5c9c"
}


# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_instance" "udacity_t2" {
  count             = 4
  ami               = "ami-0b72821e2f351e396" # Amazon Linux 2023 AMI
  instance_type     = "t2.micro"
  subnet_id         = data.aws_subnet.existing_subnet.id
  tags = {
    Name = "Udacity T2 ${count.index + 1}"
  }
}

# TODO: provision 2 m4.large EC2 instances named Udacity M4
# resource "aws_instance" "udacity_m4" {
#   count             = 2
#   ami               = "ami-0b72821e2f351e396"  # Amazon Linux 2023 AMI
#   instance_type     = "m4.large"
#   subnet_id         = data.aws_subnet.existing_subnet.id
#   tags = {
#     Name = "Udacity M4 ${count.index + 1}"
#   }
# }

# # TODO: Use Terraform to delete the 2 m4.large instances.
resource "aws_instance" "udacity_m4" {
  count             = 0
  ami               = "ami-0b72821e2f351e396"  # Amazon Linux 2023 AMI
  instance_type     = "m4.large"
  subnet_id         = data.aws_subnet.existing_subnet.id
  tags = {
    Name = "Udacity M4 ${count.index + 1}"
  }
}
