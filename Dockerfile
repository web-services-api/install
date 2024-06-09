# Use PHP 8.0 as the base image
FROM php:8.0-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set the working directory
WORKDIR /var/www/html

# Copy entire Laravel project directory
COPY . .

# Install Composer dependencies
RUN composer install

# Expose port 80
EXPOSE 80

# Start PHP-FPM server
CMD ["php-fpm"]