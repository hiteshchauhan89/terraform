provider "aws" {
        alias = "NV"
        region = "us-east-1"
        access_key = "AKIA4MI2JKFZN2JLGBJ7"
        secret_key = "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"
}
provider "aws" {
        alias = "Ohio"
        region = "us-east-2"
        access_key = "AKIA4MI2JKFZN2JLGBJ7"
        secret_key = "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"
}
resource "aws_instance" "assignment-3-1" {
        provider = aws.NV
        ami = "ami-04b4f1a9cf54c11d0"
        instance_type = "t2.micro"
        key_name = "docker"
        tags = {
        Name = "hello-virginia"
        }
}
resource "aws_instance" "assignment-3-2" {
        provider = aws.Ohio
        ami = "ami-0cb91c7de36eed2cb"
        instance_type = "t2.micro"
        key_name = "docker"
        tags = {
        Name = "hello-ohio"
        }
}
