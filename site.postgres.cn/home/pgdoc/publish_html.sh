#!/bin/bash

rm -rf /var/www/html/docs/9.3bak
mv /var/www/html/docs/9.3 /var/www/html/docs/9.3bak
cp -rf  html_out /var/www/html/docs/9.3
rm -rf /var/www/html/docs/9.3bak

