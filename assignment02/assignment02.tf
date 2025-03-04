provider "aws" {
        region = "us-east-1"
        access_key = "AKIA4MI2JKFZN2JLGBJ7"
        secret_key = "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"
}
resource "aws_instance" "assignment-2" {
        ami = "ami-04b4f1a9cf54c11d0"
        instance_type = "t2.micro"
        key_name = "docker"
        tags = {
        Name = "assignment-2"
        }
}
resource "aws_eip" "eip" {
  vpc = true
}
resource "aws_eip_association" "eip_assoc" {
instance_id   = aws_instance.assignment-2.id
allocation_id = aws_eip.eip.id
}

