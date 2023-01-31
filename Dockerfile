FROM debian

RUN apt update -y
RUN apt install -y nginx python3 python3-pip
RUN pip install certbot certbot-nginx certbot-dns-hetzner
RUN ln -s /opt/certbot/bin/certbot /usr/bin/certbot

ADD crontab /etc/crontab

VOLUME /etc/letsencrypt
VOLUME /var/www/html
VOLUME /etc/nginx/conf.d

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
