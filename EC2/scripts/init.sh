#!/usr/bin/env bash


###################
###Unzip & wget####
###################

sudo apt install unzip

sudo apt-get install wget


################
#####Docker#####
################

sudo apt update -y

sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

sudo apt update -y

sudo apt install docker-ce -y

sudo usermod -aG docker William
sudo usermod -aG docker paul
sudo usermod -aG docker Ubuntu
###use if instance changes### sudo usermod -aG docker ec2-user

sudo reboot


###############
####aws cli####
###############

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

apt install unzip -y

./aws/install 

sudo apt install awscli -y

################
####KUBECTL#####

# curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"

# chmod +x ./kubectl

# sudo mv ./kubectl /usr/local/bin/kubectl

eksctl create cluster --name cluster1 --version 1.17 --region eu-west-1 --nodegroup-name cluster1 --node-type t2.medium --nodes 2 --nodes-min 1 --nodes-max 3 --managed

sh /home/ubuntu/setupdb/initDatabase.sh