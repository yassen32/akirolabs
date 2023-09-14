#!/bin/bash

# Install OpenSSH server and utilities
apt-get update && \
    apt-get install -y openssh-server && \
    apt-get clean

# Configure SSH server
mkdir /var/run/sshd && \
    echo 'root:password' | chpasswd && \  # Set a temporary password for root (change this later)
    sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config && \
    echo "AllowUsers username" >> /etc/ssh/sshd_config

# Create a user (replace 'username' with your desired username)
useradd -m -s /usr/sbin/nologin username

# Expose the SSH port
echo "Port 22" >> /etc/ssh/sshd_config

# Start the SSH service
/usr/sbin/sshd -D

