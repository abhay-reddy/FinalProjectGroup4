# Group4-ACS730-Final Project: Two-Tier web application automation with Terraform

In this final project, we will demonstrate how to deploy a two-tier web application in an AWS environment using Terraform.

The below steps can be followed to use Terraform code to deploy the infrastructure and install a static web app that returns the web page along with images that are stored in the S3 bucket of AWS.

Steps:
1. Open the AWS comsole, create a Cloud9.
2. Clone this github repo using the command
   ```git clone https://github.com/abhay-reddy/FinalProjectGroup4.git"   ```
3. Create three S3 buckets with names "group4-dev". "group4-staging" and "group4-prod" for three different environments.
4. Create an S3 bucket by unchecking the "block public access" with name "web-images-acs730" and upload required images to it. Also provide necessory permissions to make the images accessinle to AWS env.
5. Use the image URLs inside the install_httpd script
6. In the Cloud9, install the terraform using below:
    ```
    sudo yum install -y yum-utils shadow-utils
    sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
    sudo yum -y install terraform
    ```
7. Navigate to the modules/globalvars and perform
     ```
    terraform apply
     ```
8. Now, go to the env/dev/network and use below commands to initialize, validate, plan and apply respectively. This will deploy the network part of the application.
    ```
    terraform init
    terraform validate
    terraform plan
    terrafrom apply --auto-approve
    ```
9. Go to the env/dev/webserver and use below commands to generate SSH key
    ```
    ssh-keygen -t rsa -f "Group4-dev"
     ```
10. Run the below commands to initialize, validate, plan and apply respectively. This will deploy the EC2 instance and insatll webserver.
    ```
    terraform init
    terraform validate
    terraform plan
    terrafrom apply --auto-approve
    ```
11. This will return a Load Balancer DNS name, this can be used to access the web app
12. Navigate to the env/staging/network and repeat step 8, then step 9 in env/staging/webserver
13. Repeat the step 9 and 10 in prod directory aswell.
14. Go to the AWS console and check the created EC2 instances, Load Balancers, target groups, scalingsets etc.
