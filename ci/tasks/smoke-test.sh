#!/bin/bash

set -ex
apt-get update && apt-get install -y maven
if [ -z $MOVIEFUN_SERVICE_URL ]; then
  echo "MOVIEFUN_SERVICE_URL not set"
  exit 1
fi
pushd movie-fun
  echo "Running smoke tests for Attendee Service deployed at $MOVIEFUN_SERVICE_URL"
  MOVIE_FUN_URL=http://movie-fun-pseudoarchaic-vixen.apps.cumuluslabs.io mvn test
popd

exit 0
