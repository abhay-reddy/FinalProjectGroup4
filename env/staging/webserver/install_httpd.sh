#!/bin/bash
yum -y update
yum -y install httpd
echo '<h1><center> Hello There! This is the final project of ACS730 by Group 4 Members: Abhay, Revanth and Sai Chandra</center></h1>
 <img src="URL"> <img src="URL"> <img src="URL">'   >  /var/www/html/index.html
sudo systemctl start httpd
sudo systemctl enable httpd