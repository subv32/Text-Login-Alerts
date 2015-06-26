#!/bin/bash
#LogintextAlerts.sh
#This script sends an text message (or email) everytime someone successfully logins to your server
#The limitation of this script is that it will fail if your server has more than 1 login per second. If this is the case you probably don't want an email/text message anyway
#All that needs to be changed are the variables


##The only requirement is sendEmail-v1.5.6 (and its requirements)
#http://caspian.dotconf.net/menu/Software/SendEmail/sendEmail-v1.56.tar.gz


#sendEmailLocation is where the sendEmail script should be
#phone is the email/phone# that will receive the message
#email is the email address that will send the message
#smtpserver should hold the smtp details for the email used to send the message. This should be smtp.domain.tld:port.. Default is gmail

#To use this script to send a text message you need to know your carrier's sms gateway
#You can look here http://martinfitzpatrick.name/list-of-email-to-sms-gateways/

#########VARIABLES##################
####################################
sendEmailLocation="/usr/local/bin"
phone="yournumber@yoursmsgateway.com"
email="youremail@example.com"
emailpassword="password123"
smtpserver="smtp.gmail.com:587"

####################################
while :
do
lastfive=$(cat /var/log/auth.log | grep -i 'success\|accept' | tail -5)
sleep 2
currentfive=$(cat /var/log/auth.log | grep -i 'success\|accept' | tail -5)
if [ "$lastfive" != "$currentfive" ]
then
$sendEmailLocation/sendEmail-v1.56/sendEmail -t $phone -f $email -u Logins -m $(echo -e "$currentfive" | tail -1) -s $smtpserver -xu $email -xp $emailpassword
fi
done
