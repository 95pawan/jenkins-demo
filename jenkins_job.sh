echo $(pwd)
echo repository key to the  system
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
echo $(pwd)
echo append the debian package
echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
echo $(pwd)
echo using the new repository
sudo apt-get update
echo $(pwd)
echo installing jenkins and its dependencies including java
sudo apt-get install -y jenkins
echo starting the jenkins
sleep 10
sudo systemctl start jenkins
echo cloning the repository
git clone https://github.com/95pawan/jenkins-demo.git
sleep 10
echo $(pwd)
cd jenkins-demo
echo $(pwd)
cd ..
echo after going back to jenkins-demo
echo $(pwd)
echo downloading the jenkins-cli.jar
wget https://github.com/95pawan/jenkins-demo/blob/master/jenkins-cli.jar
sleep 10
cd jenkins-demo
sleep 10
echo creating the new user for jenkins
pass=`sudo cat /var/lib/jenkins/secrets/initialAdminPassword` && echo 'jenkins.model.Jenkins.instance.securityRealm.createAccount("user", "password")' | sudo java -jar jenkins-cli.jar -authadmin:$pass -s http://localhost:8080/ groovy =
sleep 10
echo creating the user
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password create-job first1job < job.xml
