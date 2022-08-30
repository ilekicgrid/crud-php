FROM nginx:latest

RUN apk update && apk install -y php php-cli php-fpm php-json php-mysql php-zip php-gd  php-mbstring php-curl php-xml php-pear php-bcmath

COPY static/ /usr/share/nginx/html

RUN rm -rf /usr/share/nginx/html/index.html
