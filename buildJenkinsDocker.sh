#!/bin/sh
imageName=AppPulseJenkins
version=1.0
logFile=build.log
if [ "$1" = "true" ]
then
  ./copyPlugins.sh
  mkdir -p resources/SUN/JDK/1.8.0_51/linux64
#  cp -R /NAS_ROOT/products/TPS/TPS/Latest/SUN/JDK/1.8.0_51/linux64 resources/SUN/JDK/1.8.0_51/linux64
  mkdir -p resources/SUN/JDK/1.7.0_51/linux64
#  cp -R /NAS_ROOT/products/TPS/TPS/Latest/SUN/JDK/1.7.0_51/linux64 resources/SUN/JDK/1.7.0_51/linux64
  mkdir -p resources/Apache/maven/3.0.3/multi-platform
cp -R /NAS_ROOT/products/TPS/TPS/Latest/Apache/maven/3.0.3/multi-platform resources/Apache/maven/3.0.3/multi-platform
fi
docker build . | tee $logFile
containerName=`cat $logFile|grep "Successfully built"|gawk '{ print $3 }'`
echo docker commit $containerName  $imageName:$version
#docker run -h mydev.devdomain.com --name $imageName -p 80:8080 -p 50000:50000 $containerName
#./startJenkins.sh 80
