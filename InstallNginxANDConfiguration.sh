#!/usr/bin/env bash
# Purpose: install and configure nginx

#-------Variables---------#

#Configuration HTTPS
#SSLCertificatePath=
#SSLCertificateKEyPath=
#SSLDHPARAM=
#-------Function---------#

nginxConfigHttp () {
  echo "
server {

        # Port d’écoute
        listen 80;

        # Paramètres du proxy
        location / {
                proxy_pass             http://$1/;
                proxy_set_header Host     domain.tld;
        }
        }"
} >> $1

nginxConfigHttps () {
  echo "server {

        # Port d’écoute + Activation du HTTPS
        listen 443 ssl;

        # Chemin des certificats et clés
        ssl_certificate     $1;
        ssl_certificate_key     $2;
        ssl_dhparam         $3;

# Paramètres du proxy
        location / {
                proxy_pass             http://domain.tld/;
                proxy_set_header Host     domain.tld;
        }
}
"
} >> $4

show_usage () {
  echo "usage test:$0 "
}

#-------Main---------#
# update system
#apt update -y
# Check if nginx is already installed
#which nginx
#if [[ $? -eq 0 ]]; then
#  echo nginx is istalled
#else
#  echo Nginx is not installed
#  apt install nginx -y
#fi

# Check if ufw is installed
#which ufw
#if [[$? -eq 0]]; then
#    echo ufw is installed
#else
#    echo ufw is not installed
#    apt install -y
#fi


while :; do
   case "${1}" in 
     "-h"|"--help")
       show_usage
       break
       ;;
   esac
done