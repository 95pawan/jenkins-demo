sudo chmod 777 config.xml
echo disabling security
sudo sed -i 's/<useSecurity>true/<useSecurity>false/' config.xml
cd ~
echo starting the jenkins
sudo systemctl start jenkins
sleep 10
cd /var/lib/jenkins/users/admin
echo giving permission to config.xml
sudo chmod 777 config.xml
sleep 10
echo removing admin password
sudo sed -i "s|\(<passwordHash>\)[^<>]*\(</passwordHash>\)|\1${password}\2|g" config.xml
sleep 10
cd ~
echo clonning the repository
git clone https://github.com/95pawan/jenkins-demo.git
sleep 10
cd jenkins-demo
sleep 10
cd ..
echo downloading jenkins-cli.jar
wget https://github.com/95pawan/jenkins-demo/blob/master/jenkins-cli.jar
sleep 10
cd jenkins-demo
java -jar jenkins-cli.jar -s http://localhost:8080 create-job demo < job.xml
