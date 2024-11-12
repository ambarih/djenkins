variable "vpc_id" {
  description = "The ID of the VPC where the security group and instance are located."
  type        = string
  default     = "vpc-0b0c9dfa34d9e3147"
}

variable "ami_id" {
  description = "The AMI ID for the Jenkins instance."
  type        = string
  default     = "ami-063d43db0594b521b"
}

variable "instance_type" {
  description = "The instance type for the Jenkins instance."
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The key pair name for SSH access."
  type        = string
  default     = "ma-jen"
}

variable "subnet_id" {
  description = "The ID of the subnet for the Jenkins instance."
  type        = string
  default     = "subnet-0dd224f289047287b"
}

variable "user_data_file" {
  description = "Path to the file that contains user data script for Jenkins installation."
  type        = string
  default     = "jenkins-install.sh"
}

variable "default_tags" {
  description = "A map of tags to assign to resources."
  type = map(string)
  default = {
    Project     = "Jarvis"
    Environment = "Test"
    Owner       = "agangulappa@altimetrik.com"
    Application = "Web"
  }
}

variable "volume_tags" {
  description = "A map of tags to assign to volumes."
  type = map(string)
  default = {
    Project     = "Jarvis"
    Environment = "Test"
    Owner       = "agangulappa@altimetrik.com"
    Application = "Storage"
  }
}
