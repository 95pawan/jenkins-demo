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
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/ace-editor
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/ant
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/antisamy-markup-formatter
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/apache-httpcomponents-client-4-api
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/authentication-tokens
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/bouncycastle-api
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/branch-api
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/build-timeout
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/cloudbees-folder
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/command-launcher
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/credentials
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/credentials-binding
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/display-url-api
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/docker-commons
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/docker-workflow
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/durable-task
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/email-ext
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/git
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/git-client
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/github
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/github-api
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/github-branch-source
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/git-server
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/gradle
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/handlebars
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/jackson2-api
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/jquery-detached
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/jsch
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/junit
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/ldap
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/mailer
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/mapdb-api
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/matrix-auth
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/matrix-project
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/momentjs
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/pam-auth
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/ws-cleanup
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/workflow-support
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/workflow-step-api
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/workflow-scm-step
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/workflow-multibranch
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/workflow-job
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/workflow-durable-task-step
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/workflow-cps-global-lib
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/workflow-cps
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/workflow-basic-steps
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/workflow-api
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/workflow-aggregator
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/token-macro
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/timestamper
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/subversion
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/structs
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/ssh-slaves
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/ssh-credentials
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/script-security
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/scm-api
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/resource-disposer
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/plain-credentials
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/pipeline-stage-view
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/pipeline-stage-tags-metadata
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/pipeline-stage-step
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/pipeline-rest-api
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/pipeline-model-extensions
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/pipeline-model-definition
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/pipeline-model-declarative-agent
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/pipeline-model-api
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/pipeline-milestone-step
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/pipeline-input-step
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/pipeline-graph-analysis
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/pipeline-github-lib
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password install-plugin http://updates.jenkins-ci.org/download/plugins/pipeline-build-step
sleep 10
echo creating a job in jenkins
java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:password create-job first1job < job.xml
