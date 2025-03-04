provider "aws" {
        region = "us-east-2"
        access_key = "AKIA4MI2JKFZN2JLGBJ7"
        secret_key = "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"
}

resource "aws_instance" "assignment-4" {
        ami = "ami-0cb91c7de36eed2cb"
        instance_type = "t2.micro"
        key_name = "docker"
        tags = {
        Name = "assignment-1"
        }
}
