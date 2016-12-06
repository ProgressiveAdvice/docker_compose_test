FROM php:7.0-cli
COPY . /usr/aron_forras/
WORKDIR /usr/aron_forras/
CMD [ "php", "./aron.php" ]