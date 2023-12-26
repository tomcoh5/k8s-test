#!/bin/bash
# Update the package repository
sudo apt-get update -y

# Install Apache2
sudo apt-get install apache2 -y

# Start Apache2 service
sudo service apache2 start

# Enable Apache2 to start on boot
sudo systemctl enable apache2

# Get the private IP address of the instance
PRIVATE_IP=$(curl ifconfig.me)

# Create a basic HTML page displaying the server's IP address
echo "<html><head><title>My Apache Server</title></head><body><h1>Welcome to My Apache Server</h1><p>This server's IP address is: $PRIVATE_IP</p></body></html>" | sudo tee /var/www/html/index.html

# Set permissions for the HTML file
sudo chmod 644 /var/www/html/index.html

# Restart Apache to apply changes
sudo service apache2 restart
