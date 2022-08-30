FROM nginx:latest

RUN apt update && apt install -y php php-cli php-fpm php-json php-mysql php-zip php-gd  php-mbstring php-curl php-xml php-pear php-bcmath

COPY static/ /var/www/html

RUN rm -rf /var/www/html/index.html