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


## Why we have use TCP sockets instead of Unix Sockets?
    Because the nginx and wordpress are not running on same container. We can scale either wordpress container or nginx container without having problem in communication. wordpress tcp is listening on 9000 which is only accessible from localhost and is good for security reason.

## Why ondemand process management instead of static or dynamic?
    The PHP-FPM process manager is determined after assessing the available server memory, traffic spikes, website pages, CPU usage. We have used ondemand process manager because It will increased the processor based on the traffic. This will help us to handle varying traffic in the website.

    As static and dynamic are more memory intensive because they have minmum number of child process are running