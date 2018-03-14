wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt-get update
sudo apt-get install jenkins
sudo systemctl start jenkins
git clone https://github.com/95pawan/jenkins-demo.git
cd jenkins-demo
cd ..
//downloading jenkins.cli-jar from github
wget https://github.com/95pawan/jenkins-demo/blob/master/jenkins-cli.jar
cd jenkins-demo
//it will create an user for jenkins
pass=`sudo cat /var/lib/jenkins/secrets/initialAdminPassword` && echo 'jenkins.model.Jenkins.instance.securityRealm.createAccount("user1", "password123")' | sudo java -jar jenkins-cli.jar -auth admin:$pass -s http://localhost:8080/ groovy =
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user1:password123 install-plugin http://updates.jenkins-ci.org/download/plugins/git-parameter/0.1/git-parameter.hpi
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user1:password123 install-plugin http://updates.jenkins-ci.org/download/plugins/artifactdeployer/0.13/artifactdeployer.hpi
