#!/bin/bash

set -e +x
echo "Packaging JAR 1"
apt-get update && apt-get install -y maven
pushd movie-fun
  echo "Packaging JAR"
  mvn clean package -DskipTests
  echo $(ls ./target/*.*)
popd

war_count=`find movie-fun/target -type f -name *.war | wc -l`

if [ $war_count -gt 1 ]; then
  echo "More than one war found, don't know which one to deploy. Exiting"
  exit 1
fi

find movie-fun/target -type f -name *.war -exec cp "{}" package-output/movie-fun.war \;

echo "Done packaging"
exit 0
