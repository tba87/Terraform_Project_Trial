#!/bin/bash
# Install and configure Nginx on port 8080

# Install Nginx
sudo apt update -y
sudo apt install nginx -y

# Stop Nginx temporarily to make configuration changes
sudo systemctl stop nginx

# Create custom Nginx configuration for port 8080
sudo tee /etc/nginx/conf.d/custom.conf > /dev/null <<EOF
server {
    listen 8080 default_server;
    listen [::]:8080 default_server;
    
    root /var/www/nginx-html;
    
    index index.html;
    
    server_name _;
    
    location / {
        try_files \$uri \$uri/ =404;
    }
}
EOF

# Create directory and test page for Nginx
sudo mkdir -p /var/www/nginx-html
echo "<html><body><h1>Nginx running on port 8080</h1></body></html>" | sudo tee /var/www/nginx-html/index.html

# Set proper permissions
sudo chown -R www-data:www-data /var/www/nginx-html
sudo chmod -R 755 /var/www/nginx-html

# Remove default configuration that might conflict
sudo rm -f /etc/nginx/sites-enabled/default

# Test configuration and restart Nginx
sudo nginx -t && sudo systemctl start nginx
sudo systemctl enable nginx

# Configure firewall to allow both ports
sudo ufw allow 80/tcp
sudo ufw allow 8080/tcp