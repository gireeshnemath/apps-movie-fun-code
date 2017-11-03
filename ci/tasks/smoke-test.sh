#!/bin/bash

set -ex

if [ -z $MOVIEFUN_SERVICE_URL ]; then
  echo "MOVIEFUN_SERVICE_URL not set"
  exit 1
fi
apt-get update && apt-get install -y curl
pushd movie-fun
  echo "Running smoke tests for Attendee Service deployed at $MOVIEFUN_SERVICE_URL"
  smoke-tests/bin/test $MOVIEFUN_SERVICE_URL
popd

exit 0
