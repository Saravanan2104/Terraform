resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.0.0/26"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "public-subnet"
  }  
}

resource "aws_subnet" "private-subnet" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.1.0/26"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "private-subnet"
  }
  
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "my-IG"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "My-RT"
  }
}

# Associate the Route table
resource "aws_route_table_association" "public_association" {
  subnet_id = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public.id  
}

resource "aws_security_group" "main" {
  name = "dev-sg"
  description = "allow ssh , http and https"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   }
   egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
   }
  
}

resource "aws_instance" "main" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = aws_subnet.public-subnet.id
  vpc_security_group_ids = [aws_security_group.main.id]
  tags = {
    Name = var.name
  }  
}