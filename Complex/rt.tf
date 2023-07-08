# Creates a public route table with a default route to the internet gateway
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.custom-vpc.id

  # Create a default route for the internet gateway with destination 0.0.0.0/0
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform-igw.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

# Creates a private route table with a default route to the NAT gateway
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.custom-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.terraform-ngw.id
  }

  tags = {
    Name = "Private Route Table"
  }
}

# Associates the public route table with the public subnet 1
resource "aws_route_table_association" "pub-sub1-rt" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

# Associates the public route table with the public subnet 2
resource "aws_route_table_association" "pub-sub2-rt" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}

# Associates the private route table with the private subnet 1
resource "aws_route_table_association" "priv-sub1-rt" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_rt.id

  # Wait for the private route table to be created before creating this association
  depends_on = [aws_route_table.private_rt]
}

# Associates the private route table with the private subnet 2
resource "aws_route_table_association" "priv-sub2-rt" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_rt.id

  # Wait for the private route table to be created before creating this association
  depends_on = [aws_route_table.private_rt]
}