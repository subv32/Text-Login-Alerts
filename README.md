# Text-Login-Alerts
Recieve a Text/Email everytime someone logs in to your server...

This bash script will notify you everyime someone successfully su's or succesfully ssh's into your server..


 Installation instructions:
 ```
apt-get install perl libcrypt-ssleay-perl libnet-ssleay-perl
wget http://caspian.dotconf.net/menu/Software/SendEmail/sendEmail-v1.56.tar.gz
mv sendEmail-v1.56.tar.gz /usr/local/bin/
cd /usr/local/bin/
tar xvf sendEmail-v1.56.tar.gz
rm sendEmail-v1.56.tar.gz
```

Then edit the variables in the script.
