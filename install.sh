#!/bin/bash
sudo yum update -y 
sudo yum install nmap wget telnet zip -y
sudo curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo systemctl enable docker
sudo systemctl start docker
sudo docker run -d -p 80:80 --name Teste_http_port nginx
