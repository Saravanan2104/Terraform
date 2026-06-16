resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/18"
    tags = {
      Name = "my_vpc"
    }
}

resource "aws_subnet" "name" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.0.0/26"
    tags = {
      Name = "subnet-1"
    }
    availability_zone = "ap-south-1a"
}

resource "aws_subnet" "subnet" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.1.0/26"
    tags = {
      Name = "subnet-2"
    }
    availability_zone = "ap-south-1b"
}
  