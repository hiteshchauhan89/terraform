provider "aws"{
    region = "us-east-2"
    access_key = "AKIA4MI2JKFZN2JLGBJ7"
    secret_key = "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"
}
resource "aws_instance" "assignment-5"{
     ami = "ami-09040d770ffe2224f"
     instance_type = "t2.micro"
     key_name = "docker"
     user_data = <<-EOF
         #!/bin/bash
         apt update -y
         apt-get install apache2 -y
         systemctl enable apache2
         EOF
     tags = {
     Name = "assignment-5"
     }
}
output "instance_ip"{
  value = aws_instance.assignment-5.public_ip
}
resource "local_file" "instance_ip_file"{
   content = aws_instance.assignment-5.public_ip
   filename = "${path.module}/instance_ip.txt"
}
