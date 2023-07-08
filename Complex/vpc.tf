# Create an AWS VPC
resource "aws_vpc" "custom-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "my-custom-vpc"
  }
}

# Create first public subnet in the VPC
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.custom-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public subnet 1"
  }
}

# Create second public subnet in the VPC
resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.custom-vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public subnet 2"
  }
}

# Create first private subnet in the VPC
resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.custom-vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Private Subnet 1"
  }
}

# Create second private subnet in the VPC
resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.custom-vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Private Subnet 2"
  }
}