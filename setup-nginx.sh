#!/bin/bash
# Log file
LOG_FILE="log.txt"

echo "Starting Nginx setup..." | tee -a $LOG_FILE

# Install Nginx (Ubuntu example)
if ! command -v nginx >/dev/null; then
    echo "Installing Nginx..." | tee -a $LOG_FILE
    sudo apt update && sudo apt install -y nginx >> $LOG_FILE 2>&1
else
    echo "Nginx already installed." | tee -a $LOG_FILE
fi

# Start and enable Nginx
echo "Starting and enabling Nginx..." | tee -a $LOG_FILE
sudo systemctl start nginx >> $LOG_FILE 2>&1
sudo systemctl enable nginx >> $LOG_FILE 2>&1

# Test Nginx configuration
echo "Testing Nginx configuration..." | tee -a $LOG_FILE
sudo nginx -t >> $LOG_FILE 2>&1

echo "Nginx setup complete." | tee -a $LOG_FILE
