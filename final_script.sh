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
pass=`sudo cat /var/lib/jenkins/secrets/initialAdminPassword` && echo 'jenkins.model.Jenkins.instance.securityRealm.createAccount("user", "password")' | sudo java -jar jenkins-cli.jar -auth admin:$pass -s http://localhost:8080/ groovy =
echo installing suggested plugins for jenkins
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin script-security
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin command-launcher
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin cloudbees-folder
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin bouncycastle-api
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin structs
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin workflow-step-api
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin scm-api
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin workflow-api
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin junit
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin antisamy-markup-formatter
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin workflow-support
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin workflow-job
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin token-macro
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin build-timeout
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin credentials
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin ssh-credentials
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin plain-credentials
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin credentials-binding
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin timestamper
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin durable-task
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin workflow-durable-task-step
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin matrix-project
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin resource-disposer
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin ws-cleanup
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin ant
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin gradle
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin pipeline-milestone-step
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin jquery-detached
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin jackson2-api
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin ace-editor
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin workflow-scm-step
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin workflow-cps
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin pipeline-input-step
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin pipeline-stage-step
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin pipeline-graph-analysis
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin pipeline-rest-api
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin handlebars
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin momentjs
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin pipeline-stage-view
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin pipeline-build-step
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin pipeline-model-api
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin pipeline-model-extensions
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin apache-httpcomponents-client-4-api
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin jsch
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin git-client
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin git-server
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin workflow-cps-global-lib
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin display-url-api
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin mailer
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin branch-api
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin workflow-multibranch
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin authentication-tokens
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin docker-commons
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin docker-workflow
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin pipeline-stage-tags-metadata
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin pipeline-model-declarative-agent
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin workflow-basic-steps
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin pipeline-model-definition
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin workflow-aggregator
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin github-api
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin git
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin github
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin github-branch-source
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin pipeline-github-lib
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin mapdb-api
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin subversion
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin ssh-slaves
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin matrix-auth
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin pam-auth
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin ldap
sleep 5s
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin email-ext
sleep 10
cd ..
echo restarting the jenkins
sudo systemctl restart jenkins
sleep 1m
cd jenkins-demo
echo creating the job
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password create-job firstjob < job.xml
