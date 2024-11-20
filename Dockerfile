# Utiliser une image PHP de base pour un environnement de production
FROM php:8.3-cli

WORKDIR /app

RUN apt update
RUN apt install libpq-dev -y
RUN apt install git -y

RUN docker-php-ext-install pdo pdo_pgsql pdo_pgsql

COPY . /app

EXPOSE 8000
ENTRYPOINT [ "php", "artisan", "serve", "--host", "0.0.0.0" ]
