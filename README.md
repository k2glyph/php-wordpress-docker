# php-wordpress-docker
A php wordpress website docker-compose serve with nginx and php-fpm enable

## Add below domain mapping in /etc/hosts
127.0.0.1 wordpress-auzmor.com

## Running application
docker-compose up -d

## Generating ssl certifacte
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ssl/wordpress.key -out ssl/wordpress.crt

## Generating dhparam key
openssl dhparam 2048 -out ssl/wordpress.pem

## Finding issuer
openssl s_client -connect wordpress-auzmor.com:443 -status | grep "issuer"
