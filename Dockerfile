FROM php:8.3-apache-bookworm

RUN apt-get update && apt-get install -y --no-install-recommends \
    g++ \
    libicu-dev \
    libpq-dev \
    libzip-dev \
    zip \
    zlib1g-dev \
    git \
    unzip \
    && docker-php-ext-install \
        intl \
        opcache \
        pdo \
        mysqli \
        pdo_mysql \
        pdo_pgsql \
        bcmath \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 2. Configurazione Apache
RUN a2enmod rewrite

# 3. Directory di lavoro e Composer
WORKDIR /var/www/workdir
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 4. Copia configurazioni Apache e PHP
COPY ./bin/apache/default.conf /etc/apache2/sites-available/000-default.conf
COPY ./bin/php/custom.ini /usr/local/etc/php/conf.d/custom.ini

# 5. Copia dei file del progetto (se vuoi includerli nell'immagine)
# Nota: Se usi i volumi in sviluppo (bind mount), questa copia verrà sovrascritta.
COPY . /var/www/workdir

# 6. Permessi e creazione cartelle necessarie
RUN mkdir -p /var/www/logs public/storage/logs storage/logs \
    && chown -R www-data:www-data /var/www/workdir \
    && chmod -R 775 storage/logs

# 7. Esecuzione di composer install in fase di build (se il composer.json è presente)
# Rimuovi --ignore-platform-reqs se non strettamente necessario
RUN if [ -f composer.json ]; then composer install --no-interaction --prefer-dist --optimize-autoloader; fi

# 8. Esposizione della porta e avvio di Apache in foreground (modalità standard Docker)
EXPOSE 80
CMD ["apache2-foreground"]
