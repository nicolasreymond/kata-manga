FROM php:7.2-apache
RUN docker-php-ext-install pdo_mysql
RUN apt-get update && apt-get install -y git unzip zip
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer require zircote/swagger-php
RUN git clone https://github.com/swagger-api/swagger-ui.git
RUN perl -i -pe 's|^ *url:.*$|url: "/api/swagger.yml",|g' swagger-ui/dist/index.html