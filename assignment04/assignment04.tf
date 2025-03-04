provider "aws"{
    region = "us-east-2"
    access_key = "AKIA4MI2JKFZN2JLGBJ7"
    secret_key = "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"
}
resource "aws_instance" "assignment-4"{
     ami = "ami-09040d770ffe2224f"
     instance_type = "t2.micro"
     associate_public_ip_address = true
     subnet_id = aws_subnet.assignment-4-subnet.id
     key_name = "docker"
     tags = {
     Name = "assignment-4"
     }
}


resource "aws_vpc" "assignment-4-vpc"{
        cidr_block = "10.10.0.0/16"
        tags = {
        Name = "assignment-4-vpc"
        }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.assignment-4-vpc.id

  tags = {
    Name = "main-gw"
  }
}

resource "aws_subnet" "assignment-4-subnet"{
          vpc_id = aws_vpc.assignment-4-vpc.id
          cidr_block = "10.10.0.0/18"
          map_public_ip_on_launch = true
          availability_zone = "us-east-2a"
          tags = {
          Name = "assignment-4-subnet"
          }
}
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.assignment-4-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.assignment-4-subnet.id
  route_table_id = aws_route_table.public.id
}
