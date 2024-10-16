#!/bin/bash

LOGS_FOLDER="/var/log/docker"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

# Ensure the script is run as root or using superuser
if [ "$USERID" -ne 0 ]; then
  echo -e "${R}Please run with root user privileges or use sudo.${N}"  
  exit 1
else 
  echo -e "${G}Running with root user privileges.${N}"  
fi

# Step 1: Update the package manager and install dependencies
echo -e "${Y}Updating system and installing dependencies...${N}"
yum update -y | tee -a $LOG_FILE
yum install -y yum-utils | tee -a $LOG_FILE

# Step 2: Add Docker repository
echo -e "${G}Adding Docker repository...${N}"
yum-config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo | tee -a $LOG_FILE

# Step 3: Install Docker
echo -e "${Y}Installing Docker...${N}"
yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin | tee -a $LOG_FILE

# Step 4: Start Docker service
echo -e "${Y}Starting Docker service...${N}"
systemctl start docker
if [ $? -eq 0 ]; then
  echo -e "${G}Docker service started successfully!${N}"
else
  echo -e "${R}Failed to start Docker service.${N}"
  exit 1
fi

# Enable Docker service to start at boot
echo -e "${Y}Enabling Docker service at boot...${N}"
systemctl enable docker
if [ $? -eq 0 ]; then
  echo -e "${G}Docker is enabled to start on boot.${N}"
else
  echo -e "${R}Failed to enable Docker to start on boot.${N}"
fi

# Step 5: Verify Docker installation
echo -e "${G}Verifying Docker installation...${N}"
docker --version
if [ $? -eq 0 ]; then
  echo -e "${G}Docker installed successfully!${N}"
else
  echo -e "${R}Docker installation failed!${N}"
  exit 1
fi

# Step 6: Add the current user to the docker group (optional)
# echo -e "${Y}Adding the current user to the docker group to avoid using sudo...${N}"
# sudo usermod -aG docker ec2-user

# Finally
echo -e "${G}Docker is installed and running.${N}"
