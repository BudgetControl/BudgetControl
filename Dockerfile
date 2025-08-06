FROM php:8.3.23-apache-bullseye

RUN apt update \
        && apt install -y \
            g++ \
            libicu-dev \
            libpq-dev \
            libzip-dev \
            zip \
            zlib1g-dev \
        && docker-php-ext-install \
            intl \
            opcache \
            pdo \
            mysqli \
            pdo_mysql \
            pdo_pgsql \
            bcmath 

RUN apt-get -y install sudo
RUN a2enmod rewrite
RUN service apache2 restart

RUN mkdir /var/www/logs
WORKDIR /var/www/workdir

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

###########################################
# apache conf
###########################################

COPY ./bin/apache/default.conf /etc/apache2/sites-available/000-default.conf
COPY ./bin/php/custom.ini /usr/local/etc/php/conf.d/custom.ini
###########################################

RUN mkdir -p public/storage/logs/
RUN mkdir /var/www/script
COPY ./bin/entrypoint.sh /var/www/script/entrypoint.sh
RUN chmod +x /var/www/script/entrypoint.sh

ENTRYPOINT [ "/var/www/script/entrypoint.sh" ] 
