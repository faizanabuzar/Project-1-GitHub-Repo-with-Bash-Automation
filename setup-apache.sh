#!/bin/bash
# Log file
LOG_FILE="log.txt"

echo "Starting setup..." | tee -a $LOG_FILE

# Install Apache (Ubuntu example)
if ! command -v apache2 >/dev/null; then
    echo "Installing Apache..." | tee -a $LOG_FILE
    sudo apt update && sudo apt install -y apache2 >> $LOG_FILE 2>&1
else
    echo "Apache already installed." | tee -a $LOG_FILE
fi

# Configure Apache (Example: Enable mod_rewrite)
echo "Configuring Apache..." | tee -a $LOG_FILE
sudo a2enmod rewrite >> $LOG_FILE 2>&1
sudo systemctl restart apache2 >> $LOG_FILE 2>&1

echo "Setup complete." | tee -a $LOG_FILE

