#!/bin/sh
echo export http_proxy="http://web-proxy.il.hpecorp.net:8080/" > /etc/default/docker
echo export https_proxy="http://web-proxy.il.hpecorp.net:8080/" >> /etc/default/docker
echo DOCKER_OPTS="\"--insecure-registry myd-vm02816.hpswlabs.adapps.hp.com:5000 --insecure-registry `hostname -f`:5000\"" >> /etc/default/docker
service docker stop
service docker start 
