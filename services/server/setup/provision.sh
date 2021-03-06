#!/bin/bash
# DOCKER IMAGE PROVISIONING SCRIPT
# INSTALL UBUNTU WITH NODE.JS

# Create application directory
mkdir /app

# Install utilities
apt-get install -y vim wget curl bzip2 git

# Install build essentials (required for NPM package compilation)
apt-get install -y build-essential libssl-dev python

# Install NVM (node version manager)
cd /root
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh -o install-nvm.sh
bash install-nvm.sh

# load NVM
export NVM_DIR="/root/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# install node.js
nvm install 8.11.3
nvm use 8.11.3
nvm alias default 8.11.3

# Check node versions
node --version
npm --version

# Add some bash aliases
cat <<EOF >> ~/.bash_aliases
alias ll='ls -la'
alias ..='cd ..'
EOF