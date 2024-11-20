# Utiliser une image PHP de base pour un environnement de production
FROM php:8.3-cli

# Définir le répertoire de travail
WORKDIR /app

# Mettre à jour et installer les dépendances système
RUN apt update && apt install -y \
    libpq-dev \
    git \
    unzip

# Installer les extensions PHP nécessaires pour Laravel
RUN docker-php-ext-install pdo pdo_pgsql

# Installer Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Copier le contenu du projet Laravel dans l'image
COPY . .

# Installer les dépendances Laravel avec Composer
RUN composer install --no-dev --optimize-autoloader

# Générer la clé de l'application Laravel
RUN php artisan key:generate

# Exposer le port pour `php artisan serve`
EXPOSE 8000

# Commande de démarrage de l'application Laravel
ENTRYPOINT [ "php", "artisan", "serve", "--host", "0.0.0.0", "--port", "8000" ]
