#!/bin/bash
sudo apt-get update

# Installing Java
sudo apt-get install -y default-jdk

#Setting JAVA_HOME in environment
echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64/jre" >> /etc/profile
cd /opt

#Downloading Apache maven for building and packaging
wget http://www-eu.apache.org/dist/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz
sudo tar xzf apache-maven-3.5.2-bin.tar.gz
sudo ln -s apache-maven-3.5.2 apache-maven

#Setting maven home to environment
echo "export MAVEN_HOME=/usr/local/apache-maven" >> /etc/profile
echo "export PATH=${M2_HOME}/bin:${PATH}" >> /etc/profile

# Installing tomcat
cd /
sudo groupadd tomcat
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
cd /tmp
curl -O http://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.29/bin/apache-tomcat-8.5.29.tar.gz
sudo mkdir /opt/tomcat
sudo tar xzvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1
cd /opt/tomcat
sudo chgrp -R tomcat /opt/tomcat
sudo chmod -R g+r conf
sudo chmod g+x conf
sudo chown -R tomcat webapps/ work/ temp/ logs/
sudo su
cd bin

# Starting tomcat
./startup.sh

#Downloading jenkins war file and deploying in tomcat
wget https://updates.jenkins-ci.org/download/war/2.104/jenkins.war
cp jenkins.war /opt/tomcat/webapps
whoami
sleep 2m

# Printing logs for tracing
cat /opt/tomcat/logs/catalina.out
pwd
cd /root
pwd
ls

# Disabling initial admin password wizard in config.xml
cd ~
cd .jenkins
sed -i 's/"hudson.security.FullControlOnceLoggedInAuthorizationStrategy"/"hudson.security.AuthorizationStrategy$Unsecured"/g' config.xml
sed -i 's/"hudson.security.HudsonPrivateSecurityRealm"/"hudson.security.SecurityRealm$None"/g' config.xml
cd /opt/tomcat/bin

#Redeploying war to reflect changes
cp jenkins.war /opt/tomcat/webapps
wget localhost:8080
