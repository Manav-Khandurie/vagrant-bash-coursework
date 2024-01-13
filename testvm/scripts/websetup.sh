#!/bin/bash
sudo yum install wget unzip httpd -y > /dev/null
sudo systemctl start httpd
mkdir -p /tmp/webfiles
cd /tmp/webfiles
wget https://www.tooplate.com/zip-templates/2136_kool_form_pack.zip > /dev/null
unzip 2136_kool_form_pack.zip > /dev/null
cp -r 2136_kool_form_pack/* /var/www/html/
sudo systemctl restart httpd
rm -rf /tmp/webfiles
