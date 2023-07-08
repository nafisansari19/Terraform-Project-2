# Creating Security Group for ASG Launch Template
resource "aws_security_group" "lt-sg" {
  name   = "my sesurity group for ASG"
  vpc_id = "vpc-b1e841cc"

  # Inbound Rules
  # HTTP access from anywhere
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    #security_groups = [aws_security_group.alb-sg.id]
  }

  # SSH access from anywhere
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    #security_groups = [aws_security_group.alb-sg.id]
  }

  # Outbound Rules
  # Internet access to anywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}