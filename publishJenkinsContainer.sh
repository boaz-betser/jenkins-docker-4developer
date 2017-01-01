#!/bin/sh
#To run registry run:
#docker run -d -p 5000:5000 --name registry registry:2
#make sure in file /etc/default/docker you have line:
#DOCKER_OPTS="--insecure-registry <hostname>:5000"
#if not add it and run:
#service docker restart the try publish again
registry=$1
logFile=build.log

if [ "$registry" = "" ]
then
  echo "usage: command <registry host>"
  registry=privatejenkins/privatejenkins
fi
#dockerJenkins=$registry':5000/jenkinsdocker'
dockerJenkins=$registry
containerName=`cat $logFile|grep "Successfully built"|gawk '{ print $3 }'`
if [ "$containerName" = "" ]
then
  echo "missing container from file $logFile - container found: $containerName"
  exit 1
fi

echo publishing to: $dockerJenkins
docker tag $containerName $dockerJenkins
docker push $dockerJenkins 
