#!/bin/bash
set -e

# Update all packages
sudo dnf update -y

# Install Amazon Corretto 17 (Java)
sudo dnf install -y java-17-amazon-corretto
java -version || { echo "Java installation failed"; exit 1; }

# Add Jenkins repository
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Import Jenkins key
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Install Jenkins
sudo dnf install -y jenkins

# Enable and start Jenkins service
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Install Git
sudo dnf install -y git
# Print Jenkins status
sudo systemctl status jenkins || { echo "Jenkins installation failed"; exit 1; }
