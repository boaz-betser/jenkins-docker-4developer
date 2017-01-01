#!/bin/sh
echo "Usage: startDocker.sh <branch> <dockerPull true>"
startPath=`pwd`
timezone=Asia/Jerusalem
externalPort=80
cd ../
jobsPath=`pwd`/jobs
#sshPath=/root/.ssh
sshPath=`pwd`/.ssh
cd $startPath
defaultBranch=$1
if [ "$defaultBranch" = "" ]
    then
    defaultBranch=master
fi

imageName="AppPulseJenkins$externalPort"
version=1.0
logFile=build.log
JENKINS_HOSTNAME=`hostname -f`
JENKINS_INTERNAL_HTTP_PORT=9999
#containerName=myd-vm02816.hpswlabs.adapps.hp.com:5000/jenkinsdocker
containerName=`cat $logFile|grep "Successfully built"|gawk '{ print $3 }'`

runGitPull=$2
if [ "$runGitPull" = "true" ]
    then
    docker pull $containerName
fi

cmd="docker run --privileged=true  -v $jobsPath:/var/jenkins_home/jobs -v $sshPath:/root/.ssh -d -h $JENKINS_HOSTNAME --add-host mydev.devdomain.com:127.0.0.1 -e PS1=JenkinsDocker_$externalPort> -e JENKINS_OPTS=--httpPort=$JENKINS_INTERNAL_HTTP_PORT -e JAVA_OPTS=-Duser.timezone=$timezone -e externalPort=$externalPort -e defaultBranch=$defaultBranch --name $imageName -p 8080:8080 -p 9090:9090 -p 3000:3000 -p 3002:3002 -p $externalPort:$JENKINS_INTERNAL_HTTP_PORT $containerName"
echo $cmd
$cmd
