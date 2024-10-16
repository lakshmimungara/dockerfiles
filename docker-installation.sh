#!/bin/bash

# Ensure the script is run as root or using superuser
if [ "$USERID" -ne 0 ]; then
  echo "Please run with root user priviledges or use sudo"
  exit 1
  else 
  echo "It is already running with the root user priviledges"
fi

echo "Updating system and installing dependencies..."

# Step 1: Update the package manager and install necessary dependencies
yum update -y
yum install -y yum-utils 

# Step 2: Add Docker repository
echo "Adding Docker repository..."
yum-config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo

# Step 3: Install Docker
echo "Installing Docker"
yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Step 4: Start Docker service
echo "Starting Docker service"
systemctl start docker
echo "enable the docker"
systemctl enable docker

# Step 5: Verify Docker installation
echo "Verifying Docker installation..."
docker --version
if [ $? -eq 0 ]; then
  echo "Docker installed successfully!"
else
  echo "Docker installation failed!"
fi

# Step 6: Post-installation (optional)
# Add the current user to the docker group to run Docker without superuser
usermod -aG docker $USER

# Finally
echo "Docker is installed and running."
