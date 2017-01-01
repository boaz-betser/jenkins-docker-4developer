#!/bin/sh
echo Hello
mkdir -p resources/plugins
get_jpi ()
{
        wget http://updates.jenkins.io/latest/$1.hpi  -O resources/plugins/$1.jpi
}
get_jpi ant
get_jpi antisamy-markup-formatter
get_jpi antisamy-markup-formatter
get_jpi build-flow-plugin
get_jpi buildgraph-view
get_jpi cloudbees-folder
get_jpi credentials
get_jpi cvs
get_jpi envfile
get_jpi envinject
get_jpi external-monitor-job
get_jpi git-client
get_jpi git
get_jpi greenballs
get_jpi groovy
get_jpi htmlpublisher
get_jpi javadoc
get_jpi junit
get_jpi ldap
get_jpi mailer
get_jpi matrix-auth
get_jpi matrix-project
get_jpi maven-plugin
get_jpi pam-auth
get_jpi scm-api
get_jpi script-security
get_jpi ssh-credentials
get_jpi ssh-slaves
#get_jpi subversion
get_jpi translation
get_jpi windows-slaves
get_jpi workflow-step-api
get_jpi workflow-scm-step
get_jpi credentials
get_jpi authentication-tokens
get_jpi docker-commons
get_jpi icon-shim
get_jpi docker-build-publish
get_jpi token-macro
get_jpi jobConfigHistory
get_jpi ssh-agent
get_jpi structs
get_jpi slack
get_jpi git-changelog
get_jpi git-parameter
#get_jpi seleniumhtmlreport
