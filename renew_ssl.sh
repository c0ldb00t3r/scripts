#!/bin/bash
#sudo chmod +x /opt/bitnami/letsencrypt/scripts/renew-ssl.sh
#sudo crontab -e
#0 0 1 * * /opt/bitnami/letsencrypt/scripts/renew-certificate.sh 2> /dev/null


sudo /opt/bitnami/ctlscript.sh stop apache
sudo /opt/bitnami/letsencrypt/lego --tls --email="xxx@domain.com" --domains="www.domain.com" --path="/opt/bitnami/letsencrypt" renew --days 90
sudo /opt/bitnami/ctlscript.sh start apache
