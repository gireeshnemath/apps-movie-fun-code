#!/bin/bash

set -e +x
echo "Packaging JAR 1"
pushd movie-fun
  echo "Packaging JAR"
  ./mvnw clean package -DskipTests
popd

jar_count=`find movie-fun/target -type f -name *.jar | wc -l`

if [ $jar_count -gt 1 ]; then
  echo "More than one jar found, don't know which one to deploy. Exiting"
  exit 1
fi

find movie-fun/target -type f -name *.jar -exec cp "{}" package-output/movie-fun.jar \;

echo "Done packaging"
exit 0
