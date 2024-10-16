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
  echo -e "$R Please run with root user priviledges or use sudo $N"  
  exit 1
  else 
  echo -e "$G It is already running with the root user priviledges $N"  
fi

echo -e "$Y Updating system and installing dependencies...$N"

# Step 1: Update the package manager and install necessary dependencies
yum update -y | tee -a $LOG_FILE
yum install -y yum-utils  | tee -a $LOG_FILE

# Step 2: Add Docker repository
echo -e "$G Adding Docker repository...$N"
yum-config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo | tee -a $LOG_FILE

# Step 3: Install Docker
echo -e "$Y Installing Docker $N"
yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin | tee -a $LOG_FILE

# Step 4: Start Docker service
echo -e "$Y Starting Docker service $N"
systemctl start docker
echo -e "$Y enable the docker $N"
systemctl enable docker

# Step 5: Verify Docker installation
echo -e "$G Verifying Docker installation...$N"
docker --version
if [ $? -eq 0 ]; then
  echo -e "$G Docker installed successfully! $N"
else
  echo -e "$R Docker installation failed! $N"
fi

# Step 6: Post-installation (optional)
# Add the current user to the docker group to run Docker without superuser
sudo usermod -aG docker $USER

# Finally
echo -e "$G Docker is installed and running. $N"
