variable "aws_region" {
  default = "us-east-1"
  type    = string
}

variable "ami_id" {
  default = "ami-04823729c75214919"
  type    = string
}

variable "instance" {
  default = "t2.micro"
  type    = string
}

variable "key" {
  default = "MyEC2PracticeKey"
  type    = string
}

variable "vpc-id" {
  default = "vpc-b1e841cc"
  type    = string
}