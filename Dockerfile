FROM ubuntu

RUN apt-get -y update && apt-get -y install nginx

COPY default /etc/nginx/sites-enabled/
COPY nginx.conf /etc/nginx/
COPY nginx_tcp.conf /etc/nginx/
COPY index.nginx-debian.html /var/www/html/

RUN apt-get update && apt-get install -y iputils-ping
RUN apt-get update && apt-get install -y curl


EXPOSE 12345/tcp
EXPOSE 80/tcp

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
