# Use an official Nginx runtime as a parent image
FROM ubuntu:latest

# Install PHP-FPM and other necessary packages
RUN apt-get update && \
    apt-get install -y nginx php-common php-mysql php-cgi php-mbstring php-curl php-gd php-xml php-xmlrpc php-pear nano mc

# Remove the default Nginx configuration file
#RUN rm /etc/nginx/conf.d/default.conf

# Copy the custom Nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/

# Copy PHP-FPM configuration
#COPY php-fpm.conf /etc/php/7.x/fpm/

# Copy the PHP application files to the web root directory
#COPY src/ /usr/share/nginx/html/

# Expose ports
EXPOSE 80
EXPOSE 443

# Start Nginx and PHP-FPM services
CMD nginx -g "daemon off;"
