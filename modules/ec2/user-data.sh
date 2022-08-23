#!/bin/bash

# Update system packages
sudo apt-get update -y

# Install developer dependancies
sudo apt-get install build-essential -y

# Update system packages

sudo apt-get install nginx -y
sudo systemctl start nginx.service
sudo systemctl enable nginx.service

# Create project directory
sudo mkdir /var/sites
sudo chown -R ubuntu:ubuntu /var/sites
# Install Nodejs LTS

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
export NVM_DIR="/home/ubuntu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
nvm --version

nvm install 14.15.1
npm install pm2@latest -g
npm install typescript -g


# Make PM2 and Node globally

sudo ln -s ~/.nvm/versions/node/v14.15.1/bin/pm2 /usr/bin/pm2
sudo ln -s ~/.nvm/versions/node/v14.15.1/bin/npm /usr/bin/npm
sudo ln -s ~/.nvm/versions/node/v14.15.1/bin/node /usr/bin/node

#Install FFMPEG
sudo apt-get install ffmpeg -y


echo "softwares installed successfully.."