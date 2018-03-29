#!/usr/bin/env bash

set -x
mvn -pl webgoat-server spring-boot:run &
sleep 1
echo $! > .pidfile
set +x

echo "Now..."
echo "Visit http://localhost:3030 to see WebGoat running"