
provider "aws" {
  region = "us-east-1" # Adjust your region if needed
}

resource "aws_key_pair" "jenkins_key" {
  key_name   = "NewAwsKeyy"
  public_key = file("~/.ssh/id_rsa.pub") # Make sure this key exists
}

resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins-sg"
  description = "Allow SSH and Jenkins ports"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # SSH access
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Jenkins web interface
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "jenkins_server" {
  ami           = "ami-00a929b66ed6e0de6" # Amazon Linux 2023 AMI (verify latest in your region)
  instance_type = "t3.micro"
  key_name      = aws_key_pair.jenkins_key.key_name
  security_groups = [aws_security_group.jenkins_sg.name]

  user_data = <<-EOF
              #!/bin/bash
              sudo dnf update -y
              sudo dnf install java-17-amazon-corretto -y
              sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
              sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
              sudo dnf install jenkins -y
              sudo systemctl enable jenkins
              sudo systemctl start jenkins
              sudo dnf install docker -y
              sudo dnf install python3 -y


            EOF

  tags = {
    Name = "JenkinsServer"
  }
}

