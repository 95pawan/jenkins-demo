echo repository key to the  system
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
echo append the debian package
echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
echo using the new repository
sudo apt-get update
echo installing jenkins and its dependencies including java
sudo apt-get install -y jenkins
echo starting the jenkins
sudo systemctl start jenkins
echo cloning the repository
git clone https://github.com/95pawan/jenkins-demo.git
cd jenkins-demo
cd ..
echo downloading the jenkins-cli.jar
wget https://github.com/95pawan/jenkins-demo/blob/master/jenkins-cli.jar
cd jenkins-demo
echo creating the new user for jenkins
pass=`sudo cat /var/lib/jenkins/secrets/initialAdminPassword` && echo 'jenkins.model.Jenkins.instance.securityRealm.createAccount("user1", "password123")' | sudo java -jar jenkins-cli.jar -auth admin:$pass -s http://localhost:8080/ groovy =
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user1:password123 install-plugin http://updates.jenkins-ci.org/download/plugins/git-parameter/0.1/git-parameter.hpi
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user1:password123 install-plugin http://updates.jenkins-ci.org/download/plugins/artifactdeployer/0.13/artifactdeployer.hpi



