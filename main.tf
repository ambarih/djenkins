provider "aws" {
  region = "us-east-1"
}

# Security Group to allow SSH and Jenkins HTTP access
resource "aws_security_group" "djenkins_security_group" {
  name        = "djenkins_security_group"
  description = "Security group for Jenkins instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.default_tags,
    {
      Name = "JenkinsSecurityGroup"
    }
  )
}

# EC2 Instance configuration for Jenkins on Amazon Linux
resource "aws_instance" "sjenkins" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.pgs_security_group.id]
  associate_public_ip_address = true

  # Call the jenkins-install.sh script from user_data
  user_data = file("jenkins-install.sh")

  tags = merge(
    var.default_tags,
    {
      Name = "djenkins"
    }
  )
  volume_tags = merge(
    var.volume_tags,
    {
      Name = "djenkins-volume"
    }
  )
}
