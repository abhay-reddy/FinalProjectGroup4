#!/bin/bash
yum -y update
yum -y install httpd
echo '<h1><center> Hello There! This is the final project of ACS730 by Group 4 Members: Abhay, Revanth and Sai Chandra</center></h1>
 <img src="https://web-images-acs730.s3.amazonaws.com/Abhay.png"> <img src="https://web-images-acs730.s3.amazonaws.com/Revanth.png"> <img src="https://web-images-acs730.s3.amazonaws.com/Sai.png">'   >  /var/www/html/index.html
sudo systemctl start httpd
sudo systemctl enable httpd
