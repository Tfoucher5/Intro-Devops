# Utiliser l'image de base PHP avec les extensions nécessaires
FROM php:8.3-cli

# Mettre à jour le système et installer les extensions nécessaires pour PDO PostgreSQL et Composer
RUN apt-get update && apt-get install -y \
    unzip \
    curl \
    libpq-dev \
    && docker-php-ext-install pdo_pgsql

# Installer Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Créer un répertoire pour Laravel
WORKDIR /app

# Installer Laravel en utilisant Composer
RUN composer create-project --prefer-dist laravel/laravel .

# Exposer le port 8080 à l'extérieur
EXPOSE 8080

# Commande pour lancer Laravel
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8080"]
