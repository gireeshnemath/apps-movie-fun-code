#!/bin/bash

set -ex

pushd movie-fun
  echo "Fetching Dependencies"
  ./mvnw clean compile > /dev/null

  echo "Running Tests"
  ./mvnw test
popd

exit 0
